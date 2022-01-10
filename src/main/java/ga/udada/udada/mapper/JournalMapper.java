package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import ga.udada.udada.journal.JournalDTO;
import ga.udada.udada.journal.LikeyouDTO;
import ga.udada.udada.recipe.PageRequestDTO;
import ga.udada.udada.reply.ReplyDTO;


@Mapper
public interface JournalMapper {

	List<JournalDTO> getList();
	void register(JournalDTO jounalDTO);
	JournalDTO read(Long jNo);
	int update(JournalDTO journalDTO);
	int delete(Long jNo);
	List<JournalDTO> myList();
	
	void insertSelectKey(JournalDTO journalDto);
	List<JournalDTO> selectWithPaging(PageRequestDTO pageRequestDTO);
	int countAllWithSearch(PageRequestDTO pageRequestDTO);
	int mycountAllWithSearch(PageRequestDTO pageRequestDTO);
	List<JournalDTO> selectWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO);
	JournalDTO selectWithIngreAndFoodAndImage(Long jNo);
	List<JournalDTO> myselectWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO);
	
	int getLike(@Param("jNo") Long jNo, @Param("loginEmail") String loginEmail);
	List<LikeyouDTO> getLikeList(@Param("jNo") Long jNo, @Param("mEmail") String mEmail);
	void createLike(@Param("jNo") Long jNo, @Param("mEmail") String mEmail);
	void deleteLike(@Param("jNo") Long jNo, @Param("mEmail") String mEmail);
	void updateLike(@Param("jNo") Long jNo);
	List<ReplyDTO> replyList(@Param("oriNo") Long oriNo,@Param("reDiv")  String reDiv);
	int replyCount(@Param("reNo") Long reNo, @Param("oriNo") Long oriNo);
	List<ReplyDTO> commentList(@Param("reNo") Long reNo);
	
}//interface end
