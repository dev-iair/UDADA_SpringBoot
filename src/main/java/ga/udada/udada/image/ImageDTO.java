package ga.udada.udada.image;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ImageDTO {
	
	private String iUuid;
	private Long oriNo;
	private String iName;
	private String iDir;
	private String iDiv;
	
	public String getImagePath() throws Exception {
		return iDir + "/" + iUuid + iName.substring(iName.lastIndexOf("."));
	}
	
	public String getThumbnailPath() throws Exception {
		return iDir + "/" + "thumb_" + iUuid + iName.substring(iName.lastIndexOf("."));
	}
}
