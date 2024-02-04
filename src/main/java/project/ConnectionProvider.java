package project;
import java.sql.*;
import java.io.*;

public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","Djvsharp@20");
			
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
			return null;
		}

	}

}


/*package project;
import java.sql.*;
public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","Djvsharp@20");
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
			return null;
		}

	}

}*/
