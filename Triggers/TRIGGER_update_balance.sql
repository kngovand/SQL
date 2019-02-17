delimiter $$
CREATE TRIGGER trg_update_balance
AFTER insert
ON invoices
FOR EACH ROW
Begin
    UPDATE accounts
    SET Account_Bal = (Account_Bal + New.Inv_Charge)
     WHERE Account_Num = NEW.Account_Num;
END$$
