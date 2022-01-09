package ga.udada.udada.journal;

import java.util.List;

import ga.udada.udada.image.ImageDTO;
import ga.udada.udada.mapper.ImageMapper;
import ga.udada.udada.mapper.JournalMapper;
import ga.udada.udada.recipe.PageRequestDTO;
import ga.udada.udada.reply.ReplyDTO;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor

public class JournalServiceImpl implements JournalService{
	
	private final JournalMapper journalMapper;
	private final ImageMapper ImageMapper;

	@Override
	public List<JournalDTO> getList() {
			
		return journalMapper.getList();
			
	}//getList() end
	
	@Override
	public List<JournalDTO> myList() {

		return journalMapper.myList();
	}
	
	@Override
	public void register(JournalDTO journalDTO)  {
		
		journalMapper.register(journalDTO);
		
		
	}//register() end
	
	@Override
	public void registerWithImage(JournalDTO journalDTO) throws Exception {
		journalMapper.insertSelectKey(journalDTO);
		
		long jNo = journalDTO.getJNo();
		
		if(journalDTO.getImageDTO()!=null && journalDTO.getImageDTO().getIName()!="") {
			ImageDTO imageDTO = journalDTO.getImageDTO();
			imageDTO.setOriNo(jNo);
			ImageMapper.insert(imageDTO);
		}
	}
	
	@Override
	public JournalDTO read(Long jNo) {

		return journalMapper.read(jNo);
	}
	
	@Override
	public boolean modify(JournalDTO journalDTO) {

		return journalMapper.update(journalDTO)==1;
	}
	
	@Override
	public boolean remove(Long jNo) {

		return journalMapper.delete(jNo)==1;
	}
	
	@Override
	public List<JournalDTO> getListWithPaging(PageRequestDTO pageRequestDTO) throws Exception {
		return journalMapper.selectWithPaging(pageRequestDTO);
	}
	
	@Override
	public List<JournalDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception {
		return journalMapper.selectWithImageAndPagingAndSearch(pageRequestDTO);
	}
	
	@Override
	public int countAllWithSearch(PageRequestDTO pageRequestDTO) {
		return journalMapper.countAllWithSearch(pageRequestDTO);
	}
	
	@Override
	public int mycountAllWithSearch(PageRequestDTO pageRequestDTO) {

		return journalMapper.mycountAllWithSearch(pageRequestDTO);
	}
	
	@Override
	public JournalDTO getWithIngreAndFoodAndImage(Long jNo) throws Exception {
		return journalMapper.selectWithIngreAndFoodAndImage(jNo);
	}
	
	
	@Override
	public List<JournalDTO> mygetListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception {
		return journalMapper.myselectWithImageAndPagingAndSearch(pageRequestDTO);
	}
	
	@Override
	public boolean modifyWithIngreAndImage(JournalDTO journalDTO) throws Exception {
		Long jNo = journalDTO.getJNo();
		ImageMapper.delete(jNo, "JRN");
		
		int result = journalMapper.update(journalDTO);
		
		if(journalDTO.getImageDTO()!=null && journalDTO.getImageDTO().getIName()!="") {
			ImageDTO imageDTO = journalDTO.getImageDTO();
			imageDTO.setOriNo(jNo);
			ImageMapper.insert(imageDTO);
		}
		
		return result==1;
	}
	
	@Override
	public boolean removeWithIngreAndImage(Long jNo) throws Exception {
		ImageMapper.delete(jNo, "JRN");
		
		return journalMapper.delete(jNo)==1;
	}

	
	
	@Override
	public void insertLike(Long jNo, String mEmail) throws Exception {
		journalMapper.createLike(jNo, mEmail);
		journalMapper.updateLike(jNo);
		
	}
	
	@Override
	public void deleteLike(Long jNo, String mEmail) throws Exception {
		journalMapper.deleteLike(jNo, mEmail);
		journalMapper.updateLike(jNo);
		
	}
	
	@Override
	public void updateLike(Long jNo) throws Exception {
		journalMapper.updateLike(jNo);
		
	}
	
	@Override
	public int getLike(Long jNo, String loginEmail) throws Exception {
		return journalMapper.getLike(jNo, loginEmail);
	}
	
	@Override
	public List<LikeyouDTO> getLikeList(Long jNo, String mEmail) {

		return journalMapper.getLikeList(jNo, mEmail);
	}

	@Override
	public List<ReplyDTO> replyList(Long oriNo, String reDiv) {

		return journalMapper.replyList(oriNo, reDiv);
	}
	
	@Override
	public List<ReplyDTO> commentList(Long reNo) {
		
		return journalMapper.commentList(reNo);
	}
	
	
	@Override
	public int replyCount(Long reNo, Long oriNo) {
		
		return journalMapper.replyCount(reNo, oriNo);
	}

	
	
	
}//class end
