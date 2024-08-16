PL/pgSQL is a loadable procedural language for the PostgreSQL database system. The design goals of PL/pgSQL were to create a loadable procedural language that

- can be used to create functions, procedures, and triggers,

- adds control structures to the SQL language,

- can perform complex computations,

- inherits all user-defined types, functions, procedures, and operators,

- can be defined to be trusted by the server,

- is easy to use.

Functions created with PL/pgSQL can be used anywhere that built-in functions could be used. For example, it is possible to create complex conditional computation functions and later use them to define operators or use them in index expressions.
