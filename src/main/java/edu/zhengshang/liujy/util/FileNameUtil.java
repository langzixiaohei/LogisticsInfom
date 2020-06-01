package edu.zhengshang.liujy.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class FileNameUtil {
	/**
     * 文件重命名
     */
    public static String renameFileName(String fileName) {
        String formatDate = new SimpleDateFormat("yyMMddHHmmss").format(new Date()); // 当前时间字符串
        int random = new Random().nextInt(10000);
        String extension = fileName.substring(fileName.lastIndexOf(".")); // 文件后缀
 
        return formatDate + random + extension;
    }
}
