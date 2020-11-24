using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DatabaseHandler
/// </summary>
public class DatabaseHandler
{
    private SqlConnection sConn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Integrated Security=True;AttachDbFilename=|DataDirectory|\CarServiceDatabase.mdf;");
    private SqlCommand sCmd;
    private DataSet dSet;
    private SqlDataAdapter dAdapter = new SqlDataAdapter();
    private SqlCommandBuilder cBuilder;
    private String table, command;
    private String[] tableColumns;
    private List<string> tableIDs = new List<string>();
    private SqlDataReader SqlDataReader;
    private static bool loggedIn = false;
    public int row = 0;

    public DatabaseHandler(String t,String[] tc)
    {
        table = t;
        tableColumns = tc;
        setRow(t);
    }

    public static bool getLoggedInStatus()
    {
        return loggedIn;
    }

    //This method populates a table with data
    public void setTableData(String [] rowData)
    {
        command = "INSERT INTO "+table+" Values (";
        for(int x = 0; x < tableColumns.Length; ++x)
        {
            command += rowData[x]+",";
        }
        command = command.Substring(0, command.Length - 1);
        command += ")";

        sConn.Open();
        sCmd = sConn.CreateCommand();
        sCmd = new SqlCommand(command, sConn);
        sCmd.ExecuteNonQuery();
        sConn.Close();
    }

    //This method returns all table data needed to populate a datagrid
    public DataSet getTableData()
    {
        sConn.Open();
        sCmd = new SqlCommand("Select * From "+table, sConn);
        cBuilder = new SqlCommandBuilder(dAdapter);
        sCmd.ExecuteNonQuery();
        dAdapter.SelectCommand = sCmd;
        dSet = new DataSet();
        dAdapter.Fill(dSet);
        sConn.Close();
        return dSet;
    }

    //This method returns all table data needed to populate a datagrid
    public DataSet getSpecificTableData(string[] columns)
    {
        string command = "Select ";
        for (int x = 0; x < columns.Length; ++x)
        {
            command += columns[x] +" ,";
        }
        command = command.Substring(0, command.Length - 1);
        command += " From " + table;

        sConn.Open();
        sCmd = new SqlCommand(command,sConn);
        cBuilder = new SqlCommandBuilder(dAdapter);
        sCmd.ExecuteNonQuery();
        dAdapter.SelectCommand = sCmd;
        dSet = new DataSet();
        dAdapter.Fill(dSet);
        sConn.Close();
        return dSet;
    }

    //This method returns specific table data needed to populate a datagrid
    public DataSet searchTableData(String search, int columnIndex)
    {
        command = "Select * from " + table + " Where "+tableColumns[columnIndex]+" = "+search;
        //for (int x = 0; x < tableColumns.Length; ++x)
        //{
        //    command += tableColumns[x] + " = " + search + " OR ";
        //}
        //command = command.Substring(0, command.Length - 3);
        
        sConn.Open();
        sCmd = new SqlCommand(command, sConn);
        cBuilder = new SqlCommandBuilder(dAdapter);
        sCmd.ExecuteNonQuery();
        dAdapter.SelectCommand = sCmd;
        dSet = new DataSet();
        dAdapter.Fill(dSet);
        sConn.Close();
        return dSet;
    }

    //This method updates the row data
    public void updateTableData(String [] rowData)
    {
        command = "UPDATE " + table + " SET ";
        for(int x = 0; x < tableColumns.Length; ++x)
        {
            command += tableColumns[x] + " = " + rowData[x] + " , ";
        }
        command = command.Substring(0, command.Length - 2);
        command += " WHERE " + tableColumns[row] +"="+ rowData[row];
        sConn.Open();
        sCmd = sConn.CreateCommand();
        sCmd = new SqlCommand(command, sConn);
        sCmd.ExecuteNonQuery();
        sConn.Close();
    }

    //This method deletes all data in a specified database table
    public void clearTable()
    {
        sConn.Open();
        SqlCommand dbCMB = sConn.CreateCommand();
        sCmd = new SqlCommand("DELETE FROM "+table, sConn);
        sCmd.ExecuteNonQuery();
        sConn.Close();
    }

    //This method deletes a specific row in a specified database table
    public void deleteRow(string rowID)
    {
        sConn.Open();
        SqlCommand dbCMB = sConn.CreateCommand();
        sCmd = new SqlCommand("DELETE FROM " + table+" Where "+tableColumns[row]+" = "+rowID, sConn);
        sCmd.ExecuteNonQuery();
        sConn.Close();
    }

    //Ths method returns a list of every value in the id column of the table
    public List<String> getTableIDs(String t)
    {

        setRow(t);
        if (tableIDs != null)
        {
            tableIDs.Clear();
        }
        SqlCommand command = new SqlCommand("SELECT * FROM "+t,sConn);
        sConn.Open();

        SqlDataReader reader = command.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                tableIDs.Add(reader.GetString(row));
            }
        }
        else
        {
            Console.WriteLine("No rows found.");
        }
        reader.Close();
        sConn.Close();
        return tableIDs;
    }

    public void setRow(string t)
    {
        switch (t)
        {
            case "customer":
                row = 0;
                break;
            case "employee":
                row = 0;
                break;
            case "invoice":
                row = 0;
                break;
            case "job_card":
                row = 0;
                break;
            case "product":
                row = 5;
                break;
            case "quote":
                row = 0;
                break;
            case "supplier":
                row = 0;
                break;
            case "vehicle":
                row = 0;
                break;
        }
        
    }
    public bool Login()
    {
        bool login = false;

        return login;
    }
}