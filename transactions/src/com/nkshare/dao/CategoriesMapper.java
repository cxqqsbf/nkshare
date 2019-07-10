package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Categories;
import com.nkshare.vo.GoodsSearch;


public interface CategoriesMapper {
	public List<Categories> selectCategoriesByGoodsId(String Book_id);
	public List<Categories> selectCategoriesByName(GoodsSearch booksearch);
}
