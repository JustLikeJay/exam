package com.github.tangyi.user;

import com.github.tangyi.common.lucene.DocType;
import com.github.tangyi.common.lucene.IndexDoc;
import com.github.tangyi.common.lucene.LuceneIndexManager;
import org.apache.lucene.queryparser.classic.ParseException;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.List;

public class LuceneIndexManagerTests {

	@Test
	public void testAddDocument() throws IOException, ParseException {
		IndexDoc doc = new IndexDoc();
		doc.setId("1");
		doc.setContent("test 测试");
		LuceneIndexManager.getInstance().addDocument(doc, DocType.COURSE);
		List<IndexDoc> docs = LuceneIndexManager.getInstance().search(DocType.COURSE, "测试", 50);
		System.out.println(docs);
		LuceneIndexManager.getInstance().destroy();
	}
}
