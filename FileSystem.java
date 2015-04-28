package com.comcast.project;

import java.io.*;

public class FileSystem {

	public static void main(String[] args) {
		
		String dirName = "C:\\temp\\ComcastProjectFolder";
		String fileName1 = "TestFile.txt";
		String fileName2 = "TestFileCopy.txt";
		
		String fileContent = "This is a test project.";
		
		String srcFile = dirName + "\\" + fileName1;
		String destFile = dirName + "\\" + fileName2;
		
		FileFunctions obj1 = new FileFunctions();
		
		//create directory
		obj1.createFolder(dirName);
		
		obj1.createFile(srcFile);
		
		obj1.writeToFile(fileContent, srcFile);
		
		obj1.copyFile(srcFile, destFile);
		
		//file read
		
		obj1.fileRead(srcFile);
		
		obj1.dirListing("c:\\");
		
		obj1.findFile("santa.txt");
		
		System.out.println("--------------------------");
		
		obj1.findFile("santa.txt", "C:\\santasri");
		
		System.out.println("--------------------------");
		//folder copy
		File srcFolder = new File(dirName);
    	File destFolder = new File(dirName+"_New");
 
    	//make sure source exists
    	if(!srcFolder.exists()){
           System.out.println("Directory does not exist.");           
        }else{
 
           try{
        	obj1.copyFolder(srcFolder,destFolder);
           }catch(IOException e){
        	   e.printStackTrace();
        	   System.exit(0);
           }
        }

	}

}
