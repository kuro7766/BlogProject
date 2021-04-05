import 'consts.dart';
class DjangoUrl {
    static execSql(sql_str) =>Const.baseUrl + 'blog?type=exec_sql&sql_str=$sql_str';
    static getArticleContent(article_id) =>Const.baseUrl + 'blog?type=get_article_content&article_id=$article_id';
    static getTagNameById(tag_id) =>Const.baseUrl + 'blog?type=get_tag_name_by_id&tag_id=$tag_id';
    static getUserPrivateInfoByToken(token) =>Const.baseUrl + 'blog?type=get_user_private_info_by_token&token=$token';
    static getUserPublicInfoByName(user_name) =>Const.baseUrl + 'blog?type=get_user_public_info_by_name&user_name=$user_name';
    static getUserTags(user_name) =>Const.baseUrl + 'blog?type=get_user_tags&user_name=$user_name';
    static getmembers(object,predicate) =>Const.baseUrl + 'blog?type=getmembers&object=$object&predicate=$predicate';
    static hotArticle(user_name) =>Const.baseUrl + 'blog?type=hot_article&user_name=$user_name';
    static initTypes(pkg) =>Const.baseUrl + 'blog?type=init_types&pkg=$pkg';
    static insertUser(u,p) =>Const.baseUrl + 'blog?type=insert_user&u=$u&p=$p';
    static intelligentResponse(constrains,param_dict) =>Const.baseUrl + 'blog?type=intelligent_response&constrains=$constrains&param_dict=$param_dict';
    static isfunction(object) =>Const.baseUrl + 'blog?type=isfunction&object=$object';
    static loginToGetToken(u,p) =>Const.baseUrl + 'blog?type=login_to_get_token&u=$u&p=$p';
    static recentArticle(user_name) =>Const.baseUrl + 'blog?type=recent_article&user_name=$user_name';
    static releaseArticle(token,article_name,article_description,article_content,picture_url) =>Const.baseUrl + 'blog?type=release_article&token=$token&article_name=$article_name&article_description=$article_description&article_content=$article_content&picture_url=$picture_url';
    static selectArticleByText(search,user) =>Const.baseUrl + 'blog?type=select_article_by_text&search=$search&user=$user';
    static selectArticleIdByUserName(user_name) =>Const.baseUrl + 'blog?type=select_article_id_by_user_name&user_name=$user_name';
    static selectArticleIdPictureDescription(article_id) =>Const.baseUrl + 'blog?type=select_article_id_picture_description&article_id=$article_id';
    static selectArticleInfoByUserNameAndPage(user_name,page) =>Const.baseUrl + 'blog?type=select_article_info_by_user_name_and_page&user_name=$user_name&page=$page';
    static updateUserInfo(token,announcement,github,qq,csdn) =>Const.baseUrl + 'blog?type=update_user_info&token=$token&announcement=$announcement&github=$github&qq=$qq&csdn=$csdn';
    static updateUserName(token,name) =>Const.baseUrl + 'blog?type=update_user_name&token=$token&name=$name';
    
}
    