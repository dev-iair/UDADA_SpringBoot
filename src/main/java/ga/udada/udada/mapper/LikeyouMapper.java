package ga.udada.udada.mapper;

import org.apache.ibatis.annotations.Param;

public interface LikeyouMapper {

	int getLike(@Param("jNo") Long jNo, @Param("mEmail") String mEmail);
	void createLike(@Param("jNo") Long jNo, @Param("mEmail") String mEmail);
	void deleteLike(@Param("jNo") Long jNo, @Param("mEmail") String mEmail);
	void updateLike(@Param("jNo") Long jNo);
	
}//interface end
