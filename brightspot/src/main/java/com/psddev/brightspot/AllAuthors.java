package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

@Renderer.LayoutPath("/WEB-INF/modules/all-authors.jsp")
public class AllAuthors extends Page {

	@Required
	private String name;

}