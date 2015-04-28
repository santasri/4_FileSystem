package com.comcast.project;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class FileFunctions {

	
	//create directory
	public void createFolder(String dirPath){
		
		try{
			File dir = new File(dirPath);
			dir.mkdir();

		}catch(Exception e){
			e.printStackTrace();
		}
				
	}
	
	//create file
	public void createFile(String filePath){
		
		try{
			File file = new File(filePath);

			if(file.createNewFile()){
				System.out.println("new file created");
			}else{
				System.out.println("file already exists");
			}
				

		}catch(Exception e){
			e.printStackTrace();
		}
				
	}
	
	//append content to file
	public void writeToFile(String content, String filePath){
		File file = new File(filePath);
		
		try {
			//BufferedWriter writer = new BufferedWriter(new FileWriter(file,true));
			FileWriter fw = new FileWriter(file, true);
			fw.write(content + " \n");
			
			
			System.out.println(content);
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	//copy file - if destination file exists, overriding
	public void copyFile(String srcFile, String destFile){
		File file = new File(srcFile);
		File fileCopy = new File(destFile);
		try {
			Files.copy(file.toPath(), fileCopy.toPath(), StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	//read from a file
	public void fileRead(String filePath){
		try{
			BufferedReader br = new BufferedReader(new FileReader(filePath));
			
			String line = null;
			System.out.println("file content starts----------------");
			while ((line=br.readLine()) != null){
				System.out.println(line);
			}
			System.out.println("file content ends------------------");
		}catch(Exception e){
			
		}
	}
	
	//directory listing
	public void dirListing(String dirPath){
		File file = new File(dirPath);
		
		File[] listFile = file.listFiles();
		try{
		for(File fl : listFile){
			
			if(fl.isDirectory()){
				System.out.print("Directory : ");
			}else{
				System.out.print("     File : ");
			}
			System.out.println(fl.getCanonicalPath());
			
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

	//find file from root
	public void findFile(String fileName){
		File file = new File("C:\\");
		int i = 0;
		File[] listFile = file.listFiles();
		try{
			if (listFile!=null){
				for(File fl : listFile){
					
					if(fl.isDirectory()){
						findFile(fileName, fl.toPath().toString());						
					}
					else if(fileName.equals(fl.getName())){
							System.out.println("" + fileName + " is found in -> " + fl.getParentFile());							
					}
				}
			}
		}			
		catch(Exception e){
			e.printStackTrace();
		}
	}

	
	//find file in a specified directory (method overloading)
	public void findFile(String fileName, String dirPath){
		File file = new File(dirPath);
		int i = 0;
		File[] listFile = file.listFiles();
		try{
			if (listFile!=null){
				for(File fl : listFile){
					
					if(fl.isDirectory()){
						findFile(fileName, fl.toPath().toString());						
					}
					else if(fileName.equals(fl.getName())){
							System.out.println("" + fileName + " is found in -> " + fl.getParentFile());							
					}
				}
			}
		}			
		catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
	
	//copy folder - copying all the sub folders and all the files with their contents
	 public static void copyFolder(File src, File dest)	throws IOException{
		 
	    	if(src.isDirectory()){
	 
	    		//if directory not exists, create it
	    		if(!dest.exists()){
	    		   dest.mkdir();
	    		   System.out.println("Directory copied from " + src + "  to " + dest);
	    		}
	 
	    		//list all the directory contents
	    		String files[] = src.list();
	 
	    		for (String file : files) {
	    		   //construct the src and dest file structure
	    		   File srcFile = new File(src, file);
	    		   File destFile = new File(dest, file);
	    		   //recursive copy
	    		   copyFolder(srcFile,destFile);
	    		}
	 
	    	}else{
	    		//if file, then copy it
	    		//Use bytes stream to support all file types
	    		InputStream in = new FileInputStream(src);
	    	    OutputStream out = new FileOutputStream(dest); 
	 
	    	    byte[] buffer = new byte[1024];
	 
	    	    int length;
	    	    //copy the file content in bytes 
	    	    while ((length = in.read(buffer)) > 0){
	    	       out.write(buffer, 0, length);
	    	    }
	 
	    	    in.close();
	    	    out.close();
	    	    System.out.println("File copied from " + src + " to " + dest);
	    	}
	    }

}
