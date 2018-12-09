package zhang.ace;

import org.flywaydb.core.Flyway;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        load_schema_ace();
        System.out.println( "Hello World!" );
    }
    
    public static void load_schema_ace() {
        // Create the Flyway instance and point it to the database
        Flyway flyway = Flyway.configure().dataSource("jdbc:oracle:thin:@192.168.1.227:1521:orcl", "ace", "ace").load();
        // Start the migration

        flyway.migrate();
    }
}
