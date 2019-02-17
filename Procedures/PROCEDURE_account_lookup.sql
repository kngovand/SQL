delimiter $$
CREATE PROCEDURE ACLookup ( AccountNum INT )
BEGIN
SELECT * FROM accounts WHERE Account_Num = AccountNum;
End$$