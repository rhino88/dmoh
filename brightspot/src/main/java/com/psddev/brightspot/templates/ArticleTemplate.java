package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

@Renderer.LayoutPath("/WEB-INF/layout/article-template.jsp")
public class ArticleTemplate extends Template {

	private List<RightRail> rightRailModules;
	 
	public List<RightRail> getRightRailModules(){
		return rightRailModules;
	}
	
	public void setRightRailModules(List<RightRail> rightRailModules){
		this.rightRailModules = rightRailModules;
	}
}