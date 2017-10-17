---
title: KROSS API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - cURL

toc_footers:
  - 한국어음중개 API 문서에 오신 것을 환경합니다. 이 API는 한국어음중개와 협의된 기관 및 사용자가 접근할 수 있으며, 모든 정보의 지적재산권과 소유권은 한국어음중개에 있음을 공지합니다.
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://90days.kr'>for 90days Services</a>

includes:
  - inbound_links
  - errors
  - footer

search: true
---

# KROSS API 소개

한국어음중개 API 문서에 오신 것을 환경합니다.

KROSS API의 정식 서비스는 10월 30일로 예정되어 있으며, 10월 13일부터 테스트 URL [http://testapi1.kross.kr/](http://testapi1.kross.kr)를 통해 테스트 가능합니다.

정식 서비스시 API URL은 다음과 같습니다.

- API URL: [http://api1.kross.kr/](http://api1.kross.kr/)

# 인증

> 인증을 위해 아래 코드를 이용하세요.

```shell
# With shell, you can just pass the correct header with each request
curl "http://api1.kross.kr/"
  -H "Authorization: e71829c351aa4242c2719cbfbe671c09"
```

> `e71829c351aa4242c2719cbfbe671c09`는 인증을 위해 발부받은 API 키로 대체해야 합니다.

KROSS API 는 접근을 위해 당사에서 발급되는 토큰을 발부받아야 합니다. API 이용을 위한 문의는 kross@kross.kr 으로 연락주세요. [나인티데이즈 사이트](http://90days.kr/)에서 문의를 주셔도 됩니다.
인증토큰은 보통 아래와 같은 형식을 가집니다.

`Authorization: e71829c351aa4242c2719cbfbe671c09`

<aside class="success">
토큰 <code>&lt;e71829c351aa4242c2719cbfbe671c09&gt;</code>은 당사에서 발부한 토큰으로 대체해서 사용해야합니다. 
</aside>

<aside class="warning">
인증방식은 곧 JWT형식(Bearer)으로 변경될 예정이며, 변경 즉시 가입기관에게 공지될 예정입니다. 신규기관이라면 JWT형식의 인증을 대비해주시기 바랍니다.
</aside>


# API

## 할인율 조회 (발행사별)

```shell
curl "http://api1.kross.kr/preview/8498600603"
  -H "Authorization: e71829c351aa4242c2719cbfbe671c09"
```

> The above command returns JSON structured like this:

```json
{
  "request_id": 2,
  "yield": ["8498600603", 8.451, 10.102, "a4242c2719cb"]
}
```

발행사별 할인율 조회.


### HTTP Request GET

`GET http://api1.kross.kr/preview/<발행사사업자번호>`.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
발행사사업자번호 | None | 조회할 발행사 사업자번호를 입력. 대시를 포함시키는 것은 옵션이다. `849-86-00603` 과 `8498600603` 은 모두 동일함.

### Output Structures

Property | Description
--------- | -----------
request_id | 요청 ID. 증분식(incremental)
yield | 할인율. index(0:발행사 사업자번호, 1:최소할인율, 2:최대할인율, 3:Referrer_Key)

<aside class="info">
조회할 발행사가 2개 이상이라면 아래의 할인율 일괄조회가 더 유리합니다.
</aside>

## 할인율 일괄조회

```shell
curl "http://api1.kross.kr/preview_yields"
  -X POST
  -H "Authorization: e71829c351aa4242c2719cbfbe671c09"
  -H "Content-Type: application/json"
  -d '{"owner":"6088107131", "publishers":["8498600603","4358600710"]}'
```

> The above command returns JSON structured like this:

```json
{
  "owner": "6088107131",
  "yields": {
    [
      ["8498600603", 8.451, 10.102, "a4242c2719cb", "http://90days.kr/inb/6088107131?referrer_key=8498600603"],
      ["4358600710", 9.989, 12.014, "7bce93e17bca", "http://90days.kr/inb/6088107131?referrer_key=4358600710"]
    ]
  }
}
```

발행사별 할인율 일괄조회.


### HTTP Request POST

`POST http://api1.kross.kr/preview_yields`

### JSON Parameters

Parameter | Description
--------- | -----------
owner | 어음 소지인 사업자번호
publishers | 조회할 발행사 사업자번호들 (array)


### Output Structures

Property | Description
--------- | -----------
owner | 어음소지자 사업자번호
yields | 발행사별 할인율. array. index(0:발행사 사업자번호, 1:최소할인율, 2:최대할인율, 3:Referrer_Key, 4:할인의뢰Link)



