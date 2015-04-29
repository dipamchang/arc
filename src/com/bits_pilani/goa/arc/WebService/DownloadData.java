package com.bits_pilani.goa.arc.WebService;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bits_pilani.goa.arc.Registration.UploadDownloadLogic;

/**
 * Servlet implementation class DownloadData
 */
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
@WebServlet("/DownloadData")
public class DownloadData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletFileUpload uploader = null;
	@Override
	public void init() throws ServletException{
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = new File("/opt/tomcat/webapps/arc/admin_panel/");
		fileFactory.setRepository(filesDir);
		this.uploader = new ServletFileUpload(fileFactory);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownloadData() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UploadDownloadLogic data = new UploadDownloadLogic();
		String datafilename = data.generateexcelStudentReg();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(datafilename);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String basic_path = "/opt/tomcat/webapps/arc/admin_panel/";
		if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}

		//		response.setContentType("text/html");
		//		PrintWriter out = response.getWriter();
		//		out.write("<html><head></head><body>");
		try {
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
			while(fileItemsIterator.hasNext()){
				FileItem fileItem = fileItemsIterator.next();
				System.out.println("FieldName="+fileItem.getFieldName());
				System.out.println("FileName="+fileItem.getName());
				System.out.println("ContentType="+fileItem.getContentType());
				System.out.println("Size in bytes="+fileItem.getSize());

				File file = new File(basic_path+fileItem.getName());
				System.out.println("Absolute Path at server="+file.getAbsolutePath());
				fileItem.write(file);
				//				out.write("File "+fileItem.getName()+ " uploaded successfully.");
				//				out.write("<br>");
				//				out.write("<a href=\"UploadDownloadFileServlet?fileName="+fileItem.getName()+"\">Download "+fileItem.getName()+"</a>");
				request.setAttribute("message", "File Uploaded Successfully");
				UploadDownloadLogic data = new UploadDownloadLogic();
				String studentDataPath = data.populateStudentData(file.getAbsolutePath());
				request.setAttribute("passlink", "<a href=\"admin_panel/"+studentDataPath+"\" target=\"_blank\">Click to download Password file</a>");
			}
		} catch (FileUploadException e) {
			System.out.println("Exception in uploading file." + e);
			request.setAttribute("message", "File Upload Failed due to " + e);
		} catch (Exception e) {
			System.out.println("Exception in uploading file." + e);
			request.setAttribute("message", "File Upload Failed due to " + e);
		}
		//		out.write("</body></html>");
		request.getRequestDispatcher("/admin_panel/uploadDownload.jsp").forward(request, response);
	}

}
