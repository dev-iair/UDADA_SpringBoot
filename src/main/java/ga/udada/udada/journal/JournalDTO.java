package ga.udada.udada.journal;

import java.util.Date;
import java.util.List;

import ga.udada.udada.image.ImageDTO;
import ga.udada.udada.reply.ReplyDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JournalDTO {
	
	private long jNo;
	private String mEmail;
	private String jContent;
	private Date jDate;
	private int lCnt;
	private ReplyDTO replyDTO;
	private int heart;
	private String loginUser;
	private String mName;
	
	private ImageDTO imageDTO;
	private List<LikeyouDTO> likeyouList;
	private int likeCount;
	private int replyCount;
	
	private List<ReplyDTO> replyList;

}//class end
