package ga.udada.udada.journal;



public interface LikeyouService {

	int getLike(Long jNo, String mEmail) throws Exception;
	void insertLike(Long jNo, String mEmail) throws Exception;
	void deleteLike(Long jNo, String mEmail) throws Exception;
	void updateLike(Long jNo) throws Exception;
	
}//interface end
