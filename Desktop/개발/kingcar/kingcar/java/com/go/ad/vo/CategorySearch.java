package com.go.ad.vo;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;

public class CategorySearch {

  private static String PROPERTIES_FILENAME = "youtube.properties";

  private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

  private static final JsonFactory JSON_FACTORY = new JacksonFactory();

  private static final long NUMBER_OF_VIDEOS_RETURNED = 30;

  private static YouTube youtube;
  static String apiKey = "";
  
  //1. 카테고리 추가 생성 했을때 DB에 넣는 작업
  public List<ValueTransferVO> retrieveVideoList(String categoryName, String categoryNextPageToken) {
	  CategoryInfoVO categoryInfoVO = new CategoryInfoVO();
	  VideoInfoVO videoInfoVO = new VideoInfoVO();
	  ValueTransferVO valueTransferVO = new ValueTransferVO();
	  List<ValueTransferVO> valueTransferVOList = new ArrayList<ValueTransferVO>();
	//프로퍼티 파일 읽어오기
	  Properties properties = new Properties();
	    try {
	        InputStream in = CategorySearch.class.getResourceAsStream(PROPERTIES_FILENAME);
	        properties.load(in);		

	      } catch (IOException e) {
	        System.err.println("프로퍼티 파일 읽는 중 에러발생 " + PROPERTIES_FILENAME + ": " + e.getCause()
	            + " : " + e.getMessage());
	        System.exit(1);
	      }
	    
	    
	    try {
	    	//유튜브 객체 만들기
	        youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
	          public void initialize(HttpRequest request) throws IOException {}
	        }).setApplicationName("youtube-cmdline-search-sample").build();

	        // 카테고리 이름 세팅(검색어), 서버단에서 유효성체크 length>1
	        String queryTerm = categoryName;

	        //YouTube.Search.List 호출 객체 생성
	        YouTube.Search.List search = youtube.search().list("id,snippet");
	        
	        //api key 세팅
	        apiKey = properties.getProperty("youtube.apikey");	        
	        
	        // 검색조건 적용
	        search.setKey(apiKey);							//api key 세팅
	        search.setQ(queryTerm);						//검색어 세팅
	        search.set("safeSearch", "strict");		//세이프서치 적용
	        search.setType("video");						//타입 세팅
	        search.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url,snippet/channelTitle), nextPageToken,pageInfo(totalResults)");		//받아올 필드 세팅
	        search.setMaxResults(NUMBER_OF_VIDEOS_RETURNED);		//총 받아올 데이터 수, max 50
		   //같은 카테고리의 추가 데이터 입력시
	        if(!"".equals(categoryNextPageToken) && categoryNextPageToken!=null) {
		    	search.setPageToken(categoryNextPageToken);
		    }
	        
	        //변수 초기화
			String category = "";
			int videoCount = 0;
			String nextPageToken = "";
			
	        //검색 실행
	        SearchListResponse searchResponse = search.execute();
	        System.out.println(searchResponse.toString());
	        category = queryTerm;
	        nextPageToken = searchResponse.getNextPageToken();
	        videoCount = Integer.parseInt(String.valueOf(searchResponse.getPageInfo().get("totalResults")));

	        System.out.println("NextPageToken : " +searchResponse.getNextPageToken());
	        System.out.println("totalResults : "+searchResponse.getPageInfo().get("totalResults"));

	        //검색된 리스트 리턴
	        List<SearchResult> searchResultList = searchResponse.getItems();
	        
	        

	        
	        if (searchResultList != null) {
	        	valueTransferVOList = getVOList(searchResultList.iterator(), queryTerm, apiKey);
	        	
	        	for(int i=0; i<valueTransferVOList.size(); i++) {
		        	valueTransferVOList.get(i).setCategory(category);
		        	valueTransferVOList.get(i).setNextPageToken(nextPageToken);
		        	valueTransferVOList.get(i).setVideoCount(videoCount);
		        }
	        }
	        
	      } catch (GoogleJsonResponseException e) {
	        System.err.println("There was a service error: " + e.getDetails().getCode() + " : "
	            + e.getDetails().getMessage());
	      } catch (IOException e) {
	        System.err.println("There was an IO error: " + e.getCause() + " : " + e.getMessage());
	      } catch (Throwable t) {
	        t.printStackTrace();
	      }
	    
	    return valueTransferVOList;
  }
  
  //동영상 리스트 값 반환 메서드
  private static List<ValueTransferVO> getVOList(Iterator<SearchResult> iteratorSearchResults, String query, String apiKey) throws IOException {
	List<ValueTransferVO> result = new ArrayList<ValueTransferVO>();
    System.out.println("\n=============================================================");
    System.out.println(
        "   First " + NUMBER_OF_VIDEOS_RETURNED + " videos for search on \"" + query + "\".");
    System.out.println("=============================================================\n");

    if (!iteratorSearchResults.hasNext()) {
      System.out.println(" There aren't any results for your query.");
    }
    while (iteratorSearchResults.hasNext()) {


        SearchResult singleVideo = iteratorSearchResults.next();
        ResourceId rId = singleVideo.getId();
      
        if (rId.getKind().equals("youtube#video")) {
      	  //viewCount 추출을 위한 api요청 및 json파싱
          ValueTransferVO valueTransferVO = new ValueTransferVO();
      	  JSONObject json = readJsonFromUrl("https://www.googleapis.com/youtube/v3/videos?part=statistics&id="+rId.getVideoId()+"&key="+apiKey);
      	  JSONArray rootObject = (JSONArray) json.get("items");
      	  JSONObject statistics = (JSONObject) rootObject.getJSONObject(0).get("statistics");
      	  //변수 세팅
      	  String title = singleVideo.getSnippet().getTitle().trim();
      	  String videoId = rId.getVideoId();
    	  String thumbnail = singleVideo.getSnippet().getThumbnails().get("default").getUrl();
    	  String channelTitle = singleVideo.getSnippet().get("channelTitle").toString();
    	  int viewCount = Integer.parseInt(statistics.get("viewCount").toString());
    	  String viewFlag = "N";	
    	  //저장할 vo 세팅
    	  valueTransferVO.setTitle(title);
          valueTransferVO.setVideoId(videoId);
          valueTransferVO.setThumbnail(thumbnail);
          valueTransferVO.setChannelTitle(channelTitle);
          valueTransferVO.setViewCount(viewCount);
          //리스트에 추가
          result.add(valueTransferVO);
          
          System.out.println(" Video Id: " + videoId);
          System.out.println(" Title: " + title);
          System.out.println(" Thumbnail: " + thumbnail);
          System.out.println(" channelTitle: " + channelTitle);
          System.out.println(" view count: "+ viewCount);
          System.out.println("\n-------------------------------------------------------------\n");
      }
    }
	return result;
  }
  
  private static String readAll(Reader rd) throws IOException {
	    StringBuilder sb = new StringBuilder();
	    int cp;
	    while ((cp = rd.read()) != -1) {
	      sb.append((char) cp);
	    }
	    return sb.toString();
	  }
  
  public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
	    InputStream is = new URL(url).openStream();
	    try {
	      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
	      String jsonText = readAll(rd);
	      JSONObject json = new JSONObject(jsonText);
	      return json;
	    } finally {
	      is.close();
	    }
	  }
  
  
  
}