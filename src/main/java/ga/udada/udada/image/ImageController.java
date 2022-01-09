package ga.udada.udada.image;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class ImageController {

	public static String uploadFolder ="C:/study/upload";
	
	public static ImageDTO uploadImage(MultipartFile image) throws Exception {

		if(!(image.getContentType().startsWith("image"))){
			return null;
		}
		
		String originalName = image.getOriginalFilename();
		String ext = originalName.substring(originalName.lastIndexOf("."));
		String uuid = UUID.randomUUID().toString();
		String dir = makeDirectory();
		String imageFullName = uploadFolder + File.separator + dir + File.separator + uuid + ext;
		
		
		 Path saveImage = Paths.get(imageFullName);
		 image.transferTo(saveImage);
		 
		 String thumbnailFullName = uploadFolder + File.separator + dir + File.separator + "thumb_" + uuid + ext;
         File thumbnailImage = new File(thumbnailFullName);
         
         Thumbnailator.createThumbnail(saveImage.toFile(), thumbnailImage, 150,150);
         
		 ImageDTO imageDTO = ImageDTO.builder()
				 .iUuid(uuid)
				 .iName(originalName)
				 .iDir(dir)
				 .build();
		 
		return imageDTO;
		
	}
	
	@ResponseBody
	@GetMapping("/image/show")
    public ResponseEntity<byte[]> showImage(String imagePath) throws Exception{
 
         File file = new File(uploadFolder + File.separator + imagePath);
         HttpHeaders header = new HttpHeaders();
         header.add("Content-Type", Files.probeContentType(file.toPath()));
        
         return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);     
    } 

    public static boolean removeImage(String imagePath) throws Exception{

        File file = new File(uploadFolder+File.separator + imagePath);
        File thumbnailImage = new File(file.getParent(), "thumb_"+file.getName());
        if(file.exists()) {
            file.delete();
            thumbnailImage.delete();
        }     
        return true;
}
    
	private static String makeDirectory() throws Exception{
		
		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
        String directory = str.replace("//", File.separator);
        File uploadDirectory = new File(uploadFolder , directory);
        if(uploadDirectory.exists()==false){
        	uploadDirectory.mkdirs();
        }
        return directory;
	}
	

}
