---
title: KROSS API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell(cURL)

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://90days.kr'>for 90days Services</a>

includes:
  - errors

search: true
---

# KROSS API 소개

한국어음중개 API 문서에 오신 것을 환경합니다. 이 API는 한국어음중개와 협의된 기관 및 사용자가 접근할 수 있으며, 모든 정보의 지적재산권과 소유권은 한국어음중개에 있음을 공지합니다.

KROSS API의 정식 서비스는 10월 30일로 예정되어 있으며, 10월 13일부터 테스트사이트[http://testapi1.kross.kr/](http://testapi1.kross.kr)를 통해 테스트 가능합니다.

# 인증

> 인증을 위해 아래 코드를 이용하세요.

```shell
# With shell, you can just pass the correct header with each request
curl "https://api1.kross.kr/"
  -H "Authorization: meowmeowmeow"
```

> `meowmeowmeow`는 인증을 위해 발부받은 API 키로 대체해야 합니다.

KROSS API 는 접근을 위해 당사에서 발급되는 토큰을 발부받아야 합니다. API 이용을 위한 문의는 mailto:kross@kross.kr 으로 연락주세요. [나인티데이즈 사이트](http://90days.kr/)에서 문의를 주셔도 됩니다.
인증토큰은 보통 아래와 같은 형식을 가집니다.

`Authorization: meowmeowmeow`

<aside class="warning">
토큰 <code>&lt;meowmeowmeow&gt;</code>은 당사에서 발부한 토큰으로 대체해서 사용해야합니다. 
</aside>

# API

## 발행사별 할인율 조회 (미리보기)

```shell
curl "http://api1.kross.kr/preview/8498600603"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "request_id": 2,
  "yield": ["8498600603", 8.451, 10.102]
}
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://api1.kross.kr/preview/<발행사사업자번호>`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
발행사사업자번호 | None | 조회할 발행사 사업자번호를 입력. 대시를 포함시키는 것은 옵션이다. `849-86-00603` 과 `8498600603` 은 모두 동일함.


## 발행사들에 대한 할인율 일괄조회

```shell
curl "http://api1.kross.kr/preview_yields"
  -X POST
  -H "Authorization: meowmeowmeow"
  -H "Content-Type: application/json"
  -d '{"owner":"6088107131", "publishers":["8498600603","4358600710"]}'
```

> The above command returns JSON structured like this:

```json
{
  "owner": "6088107131",
  "yields": {
    [
      ["849-86-00603", 8.451, 10.102],
      ["435-86-00710", 9.989, 12.014]
    ]
  }
}
```

This endpoint retrieves a specific kitten.


### HTTP Request

`POST http://api1.kross.kr/preview_yields`

### JSON Parameters

Parameter | Description
--------- | -----------
owner | 어음 소지인 사업자번호
publishers | 조회할 발행사 사업자번호들 (array)


