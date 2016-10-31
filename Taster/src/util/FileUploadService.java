package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUploadService {
	public void makeBasePath(String path) {
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}

	public String saveFile(File file, String basePath, String fileName) throws IOException {
		if (file == null || file.getName().equals("") || file.length() <= 0) {
			return null;
		}

		// 베이스 폴더 생성
		makeBasePath(basePath);

		// 저장할 전체 경로 생성
		String serverFullPath = basePath + "/" + fileName;

		// 파일저장
		FileInputStream inputStream = new FileInputStream(file);
		FileOutputStream outputStream = new FileOutputStream(serverFullPath);

		int read = 0;
		byte[] buffer = new byte[1024];
		while ((read = inputStream.read(buffer, 0, 1024)) != -1) {
			outputStream.write(buffer, 0, read);
		}
		outputStream.close();
		inputStream.close();
		return serverFullPath;
	}
}
