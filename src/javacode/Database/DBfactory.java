package javacode.Database;

import javacode.MyDBConnection;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.sql.PreparedStatement;

public class DBfactory {
    public File file;
    public Workbook workbook;
    public Sheet sheet;

    public DBfactory(String path) {
        file = new File(path);
        fetchExcel();
    }

    private boolean insertFromExcel() {
        int num_row = sheet.getPhysicalNumberOfRows();
        int num_col = sheet.getRow(0).getPhysicalNumberOfCells();

        for (int row = 1; row < num_row; row++) {
            Row temp = sheet.getRow(row);
            try {
                String sql = "insert into library.book (bookID,cover,title,author,state,ISBN,description) values(?,?,?,?,?,?,?)";
                PreparedStatement prest = MyDBConnection.getMyConnection().prepareStatement(sql);

                prest.setString(1, temp.getCell(0).toString());

                File file = new File(temp.getCell(1).toString());
                FileInputStream fis = new FileInputStream(file);
                prest.setBinaryStream(2, fis, file.length());

                prest.setString(3, temp.getCell(2).toString());
                prest.setString(4, temp.getCell(3).toString());
                prest.setString(5, "on shelf");
                prest.setString(6, temp.getCell(4).toString());
                prest.setString(7, temp.getCell(5).toString());

                prest.execute();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return true;
    }

    private void fetchExcel() {
        String filePath = file.getPath();
        String suffix = filePath.substring(filePath.lastIndexOf('.')); //get the suffix of the file and judge its format

        try {
            InputStream inputStream = new FileInputStream(file);
            if (suffix.equals(".xls")){                                    //when its file name ended with ".xls"
                workbook = new HSSFWorkbook(inputStream);
                sheet = workbook.getSheetAt(0);
            } else if (suffix.equals(".xlsx")) {                           //when its file name ended with ".xlsx"
                workbook = new XSSFWorkbook(inputStream);
                sheet = workbook.getSheetAt(0);
            } else {
                workbook = null;
            }
        } catch (FileNotFoundException e) {                                //deal with exceptions
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
