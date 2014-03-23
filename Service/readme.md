#Configure Connection to generate repositories
	1. Change "ServiceConnection" to your db connection.
	2. If configuring new connection in config file change it in service.tt
		string connectionNameStringConfigName = "YourCNConfigName";

#Configure Tables to generate repositories/services
	1. Add your name of tables in service.tt
		string[] tables = new string[]{ "Table1", "Table2", ...., "TableN" };

#How to avoid overwrite your own code in repositories?
	1. All repositories that "service.tt" will generate are partial so you need to imitate its structure in another file in repositories folder.
	2. Add your own methods in respective interface and implement them in your class, those will continue to run inspite of code generation.

#TODO
	1. Need to take table names from direct db connection
	2. Need to singularize table names
	3. Need to generate Models