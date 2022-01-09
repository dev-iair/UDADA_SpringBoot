package ga.udada.udada.reply;

public interface ReplyService {

	int insertReply(String reContent, Long oriNo, String mEmail, String reDiv) throws Exception;
	int commentinsert(String reContent, Long oriNo, String mEmail, String reDiv, int reGroup) throws Exception;
	int deleteReply(Long reNo, int commentCheck) throws Exception;
	void replyModify(String reContent, Long reNo) throws Exception;
	
}//interface end
