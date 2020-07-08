## Question

1. UTF-16的问题  《Java核心技术》 P35

  NFC，默认参数，表示“标准等价合成”（Normalization Form Canonical Composition），返回多个简单字符的合成字符。所谓“标准等价”指的是视觉和语义上的等价
  
  NFD，表示“标准等价分解”（Normalization Form Canonical Decomposition），即在标准等价的前提下，返回合成字符分解的多个简单字符

  NFKC，表示“兼容等价合成”（Normalization Form Compatibility Composition），返回合成字符。所谓“兼容等价”指的是语义上存在等价，但视觉上不等价，比如“囍”和“喜喜”。（这只是用来举例，normalize方法不能识别中文。）

  NFKD，表示“兼容等价分解”（Normalization Form Compatibility Decomposition），即在兼容等价的前提下，返回合成字符分解的多个简单字符


  参考链接   https://www.cnblogs.com/xiaohuochai/p/7230328.html

  https://developer.twitter.com/en/docs/basics/counting-characters.html

  http://unicode.org/reports/tr15/#Normalization_Forms_Table

  http://utf8everywhere.org/zh-cn

  https://github.com/twitter/twitter-text`


  https://developer.twitter.com/en/docs/developer-utilities/twitter-text.html


  不可变类概念



