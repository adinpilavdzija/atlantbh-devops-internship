# Deploy Backend with PostgreSQL integration

## Task
Deploy Backend with PostgreSQL integration.

## Check PostgreSQL Dependency
Make sure you have the PostgreSQL JDBC driver as a dependency in `pom.xml` file. The JDBC driver enables Java applications to interact with Postgres databases.

For Maven, add the following dependency if missing:

```xml
//pom.xml
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
</dependency>
```

## Database configuration 

In its default configuration, Petclinic uses an in-memory database (HSQLDB) which gets populated at startup with data. A similar setups is provided for MySql and PostgreSQL in case a persistent database configuration is needed. To run petclinic locally using persistent database, it is needed to change profile defined in application.properties file.

For PostgeSQL database, it is needed to change param `hsqldb` to `postgresql` in string defined in `application.properties` file:
```
spring.profiles.active=hsqldb,spring-data-jpa
```
```
spring.profiles.active=postgresql,spring-data-jpa
```

 > **Note**
 > `src/main/resources/application.properties`

Before you do this, it would be good to check properties defined in `application-postgresql.properties` file.

```
//application-postgresql.properties
spring.datasource.url=jdbc:postgresql://localhost:5432/db_name
spring.datasource.username=username #username of the user with the necessary permissions for the above specified database 
spring.datasource.password=password #password of the user above
spring.datasource.driver-class-name=org.postgresql.Driver
spring.jpa.database=POSTGRESQL
spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.hibernate.ddl-auto=none
```

Change value for property `ddl-auto` from `none` to `update`:
```
spring.jpa.hibernate.ddl-auto=update
```

<details>
<summary>ddl-auto property</summary>

The ddl-auto property sets the behavior of Hibernate’s schema generation tool and has five possible values:
- `create` – On application start-up, drop all tables managed by Hibernate, - then create them from scratch.
- `create-drop` – On application start-up, create all tables managed by - Hibernate. On shutdown, drop all of them.
- `update` – On application start-up, update the existing tables to match the schema Hibernate expects if necessary.
- `validate` – On application start-up, check that the existing tables match the schema Hibernate expects, and throw an exception if they do not match.
- `none` – Do not perform any automatic schema management.
</details>
<br>

## Screenshots 

<details>
<summary>Screenshots</summary>

Select query in psql on table `specialties`:  
![01](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/283e88c3667e40917290fc13a46a38b69f18697e/06_backend_postgresql_integration/01_screenshot_db_select_before.png)

Executed POST method in Swagger:  
![02](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/283e88c3667e40917290fc13a46a38b69f18697e/06_backend_postgresql_integration/02_screenshot_post_1.png)
![03](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/283e88c3667e40917290fc13a46a38b69f18697e/06_backend_postgresql_integration/03_screenshot_post_2.png)

Status code after manipulation of data:  
![04](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/283e88c3667e40917290fc13a46a38b69f18697e/06_backend_postgresql_integration/04_screenshot_post_status_code.png)

Select query in psql on table `specialties` after manipulation of data:  
![05](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/283e88c3667e40917290fc13a46a38b69f18697e/06_backend_postgresql_integration/05_screenshot_db_select_after.png)
</details>
