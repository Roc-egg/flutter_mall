/// <BaseRespR<T> 返回 status code msg data Response.
class Result<T> {
  int errno;
  String errmsg;
  T data;

  Result(this.errno, this.errmsg, this.data);

  Result.fromJson(Map<String, dynamic> json)
      : errno = json['errno'],
        errmsg = json['errmsg'],
        data = json['data'];

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"errno\":$errno");
    sb.write(",\"msg\":\"$errmsg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}