# SQL
MySQL Finance Database

Our team has decided to implement a relational database that is used to solve a real life problem.  
This database will hold Business accounts, where they have a relationship with customers and other users.  
The data stored in Business accounts will contain a unique company name, identifier (such as a key or ID)  
which will contain various information about the account. Our group is unsure of which attributes we will  
implement in the final design, but we are speculating that the data stored will have values such as finances  
(for each customer, whether they owe money or the latter), company info (such as address, phone number, email,  
etc), and which customers they are in business in.    
  
The relational model is many-to-many, where companies can have many customers, but customers can also belong
to many companies as well. On the customer side of the database, we are also unsure of what key attributes to use,
but it should be somewhat of a trivial task. We brainstormed and thought of the important aspects when it comes
to storing customer data, so we came up with this list: Customer name and/or identifier (ID or key), basic customer
information, association with other companies, and sensitive information (such as credit cards, social security, etc).
For the sensitive data, we were planning to research on how data is properly encrypted and stored in these  
databases; encrypting data is an important aspect of protecting customer data and we were thinking  
of properly implementing that as well.    
  
In addition to storing this data, our group wanted to also be able to modify the data. From  
adding new entries, removing old data, editing said data, we wanted to implement a database  
system that functions similarly to any other realistic system utilized by business for finances.  
Since finances are typically heavy in data, we were also thinking of adding basic functionality to  
these attributes, such as add, subtract, divide, etc. With that being said, SQLite3’s library has  
great resources in its built-in library, so we will most likely use things such as .findByID and  
other methods that will greatly increase the functionality of the database with the given amount  
of time for this project.  
