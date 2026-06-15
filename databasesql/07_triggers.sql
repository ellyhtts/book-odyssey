-- DROP FUNCTION public.calculapreconocadastro();

alter table book add column if not exists base_price DECIMAL(10,2);
alter table book add column if not exists final_price DECIMAL(10,2);

CREATE OR REPLACE FUNCTION calculapreconocadastro()
	RETURNS trigger as $$
	declare 
	v_depreciacao decimal (5,2);
	
	BEGIN
select price_depreciation into v_depreciacao 
from book_condition
where id = new.id_condition;

new.final_price := new.base_price - v_depreciacao;
return new;

	END;
$$ LANGUAGE plpgsql;

create trigger calcula_preco
before insert on book 
for each row
execute function calculapreconocadastro();

------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_gerar_pontos_doacao()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id_supplier IS NOT NULL THEN 
        UPDATE supplier_coupon
        SET donated_books_quantity = donated_books_quantity + 1,
            redemption_points = redemption_points + 10 
        WHERE id = NEW.id_supplier;
        
        IF NOT FOUND THEN
            INSERT INTO supplier_coupon (id, donated_books_quantity, redemption_points)
            VALUES (NEW.id_supplier, 1, 10);
        END IF;
        
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_gerar_pontos_doacao
AFTER INSERT ON book
FOR EACH ROW
EXECUTE FUNCTION fn_gerar_pontos_doacao();

-- ---------------------------------------------------------

CREATE OR REPLACE FUNCTION trg_AtualizaEstoqueVenda_Func()
RETURNS TRIGGER AS $$
BEGIN
    
    IF NEW.status = 'Pago' AND OLD.status IS DISTINCT FROM 'Pago' THEN
        
        UPDATE book
        SET is_active = FALSE 
        WHERE id IN (
            SELECT id_book
            FROM order_item
            WHERE id_order = NEW.id
        );
        
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER AtualizaEstoqueVenda
AFTER UPDATE OF status ON book_order
FOR EACH ROW
EXECUTE FUNCTION trg_AtualizaEstoqueVenda_Func();