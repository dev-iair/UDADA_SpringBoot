package ga.udada.udada.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import ga.udada.udada.image.ImageDTO;

@Mapper
public interface ImageMapper {
	
	void insert(ImageDTO imageDTO);
	int delete(@Param("oriNo") Long oriNo, @Param("iDiv")String iDiv);

}
