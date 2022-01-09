package ga.udada.udada.reply;

import ga.udada.udada.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	private final ReplyMapper replyMapper;

	@Override
		public int insertReply(String reContent, Long oriNo, String mEmail, String reDiv) throws Exception {

			return replyMapper.insert(reContent, oriNo, mEmail, reDiv);
		}
	
	@Override
	public int commentinsert(String reContent, Long oriNo, String mEmail, String reDiv, int reGroup) throws Exception {
		
		return replyMapper.commentinsert(reContent, oriNo, mEmail, reDiv, reGroup);
	}
	
	
	@Override
		public int deleteReply(Long reNo, int commentCheck) throws Exception{
			
			return replyMapper.delete(reNo, commentCheck);
		}
	
	@Override
	public void replyModify(String reContent, Long reNo) throws Exception {
		
		replyMapper.update(reContent, reNo);
	}
	
}//class end
