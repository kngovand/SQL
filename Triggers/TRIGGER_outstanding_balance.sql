delimiter $$
CREATE TRIGGER trg_outstanding_balance
AFTER UPDATE
ON accounts
FOR EACH ROW
BEGIN
INSERT INTO outstanding_bal (Account_Num)
SELECT Account_Num FROM accounts WHERE Account_Bal > 10000000;
END$$