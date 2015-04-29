package com.bits_pilani.goa.arc.Registration;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;

import com.bits_pilani.goa.arc.Dao.Data;
import com.bits_pilani.goa.arc.Dao.StudentData;
import com.bits_pilani.goa.arc.Dao.TimeTable;
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
public class UploadDownloadLogic {
	public String basic_path = "/opt/tomcat/webapps/arc/admin_panel/";

	public String generateexcelStudentReg(){
		StudentData getData = new StudentData();
		List<StudentDetailsBean> allRegData = getData.getAllRegData("", "5");
		String filename = "RegData_"+System.currentTimeMillis()+".xls" ;
		String fullPathName=basic_path+filename ;

		try{

			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("Registration Data");
			HSSFRow rowhead = sheet.createRow(0);
			rowhead.createCell(0).setCellValue("Class No");
			rowhead.createCell(1).setCellValue("ID No");
			rowhead.createCell(2).setCellValue("Name");
			rowhead.createCell(3).setCellValue("Card No");
			rowhead.createCell(4).setCellValue("Time Stamp");

			int rowCount = 1;
			for (StudentDetailsBean studentDetailsBean : allRegData) {
				if(studentDetailsBean.getCombination() != "deReg" || studentDetailsBean.getCombination() != "not"){
					List<Integer> classNolist = (new TimeTable()).getClassNumbers(studentDetailsBean.getCombination());
					for (Integer clasNo : classNolist) {
						HSSFRow row=   sheet.createRow(rowCount++);
						row.createCell(0).setCellValue(clasNo);
						row.createCell(1).setCellValue(studentDetailsBean.getStudentId());
						row.createCell(2).setCellValue(studentDetailsBean.getStudentName());
						row.createCell(3).setCellValue(studentDetailsBean.getCombination());
						row.createCell(4).setCellValue(studentDetailsBean.getTimestamp());
					}
				}
			}

			FileOutputStream fileOut =  new FileOutputStream(fullPathName);
			wb.write(fileOut);
			fileOut.close();
			System.out.println("Your excel file has been generated!");

		}catch(Exception e) {
			e.printStackTrace();
		}
		return filename;
	}

	public String populateStudentData(String filepath){
		String filename = "StudentData_"+System.currentTimeMillis()+".xls";
		String StudentDatafilename=basic_path+filename ;

		try {

			//Creating new excel
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("Student Password");
			HSSFRow rowhead = sheet.createRow(0);
			rowhead.createCell(0).setCellValue("ID");
			rowhead.createCell(1).setCellValue("Name");
			rowhead.createCell(2).setCellValue("Password");

			FileInputStream fileInputStream = new FileInputStream(filepath);
			HSSFWorkbook workbook = new HSSFWorkbook(fileInputStream);
			HSSFSheet worksheet = workbook.getSheetAt(0);

			Iterator<Row> rowIterator = worksheet.iterator();
			rowIterator.next();
			StudentData stuData = new StudentData();
			stuData.truncateStudentDB();
			int rowCount = 1;
			while(rowIterator.hasNext()){
				Row row = rowIterator.next();
				String id = row.getCell(0).getStringCellValue();
				String name = row.getCell(1).getStringCellValue();
				String passs = Integer.toString(sixDigitPass());
				stuData.insertStudentData(id, name, passs);

				HSSFRow erow = sheet.createRow(rowCount++);
				erow.createCell(0).setCellValue(id);
				erow.createCell(1).setCellValue(name);
				erow.createCell(2).setCellValue(passs);
			}
			workbook.close();
			fileInputStream.close();

			FileOutputStream fileOut =  new FileOutputStream(StudentDatafilename);
			wb.write(fileOut);
			fileOut.close();
			wb.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filename;

	}

	public int sixDigitPass(){
		Random rnd = new Random();
		int n = 100000 + rnd.nextInt(900000);
		return n;
	}

	public static void main(String[] args) {
		UploadDownloadLogic asdf = new UploadDownloadLogic();
		asdf.generateexcelStudentReg();
	}
}
