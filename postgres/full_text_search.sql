
/*
  tsvector : datatype that is basically a list of tokens
  - string is reduced to a list of lexeme (unit of lexical meaning) eg jumping -> jump
  - common NLP technique
*/

SELECT to_tsvector('some search string');
SELECT to_tsvector('Portuguese', 'Zebras caolhas de Java querem mandar fax para gigante em New York');

/*
  tsquery : data type that is a list of words that can be checked against a tsvector
  - also comes with some operators
*/

SELECT tsvector('this should match') @@ tsquery('match')

/*
  () | & ! are standard operators like you'd see elsewhere
*/
SELECT to_tsvector('The quick brown fox jumped over the lazy dog') @@ to_tsquery('fox & (dog | clown) & !queen');

/*
  ts_headline : function to highlight hits in the text
*/

SELECT ts_headline('english', 'this is the text of the article', to_tsquery('text | article'))

/*
  below are examples of AR generated SQL with the pg_search gem
*/

SELECT 
	id,
	ts_headline(name, query)
FROM (
	SELECT id, name, query
    FROM 
      public.lessons, 
      to_tsquery('center') query
    WHERE 
      name @@ query
    LIMIT 10
	);

SELECT 
  "lessons".* 
FROM 
  "lessons" 
  INNER JOIN (
    SELECT 
      "lessons"."id" AS pg_search_id, 
      (
        ts_rank(
          (to_tsvector('simple', coalesce("lessons"."name"::text, ''))), 
          (to_tsquery('simple', ''' ' || 'center' || ' ''' || ':*')),
          0
        )
      ) AS rank 
    FROM 
      "lessons" 
    WHERE 
      ((to_tsvector('simple', coalesce("lessons"."name"::text, ''))) @@ (to_tsquery('simple', ''' ' || 'center' || ' ''' || ':*')))
  ) AS pg_search_314a6b49660562c305aaf8 ON "lessons"."id" = pg_search_314a6b49660562c305aaf8.pg_search_id 
ORDER BY
  pg_search_314a6b49660562c305aaf8.rank DESC, 
  "lessons"."id" ASC

SELECT 
  lessons.*,
  (
    (
      ts_headline(
        'simple', 
        (coalesce("lessons"."name"::text, '')), 
        (to_tsquery('simple', ''' ' || 'center' || ' ''' || ':*')), 
        'StartSel = "<b>", StopSel = "</b>", MaxFragments = 3, MaxWords = 100, MinWords = 0, ShortWord = 4, FragmentDelimiter = "--xxx--", HighlightAll = TRUE'
      )
  ) AS .pg_name_search_highlight,
  (
    (
      ts_headline(
        'simple', 
        (coalesce("lessons"."name"::text, '')), 
        (to_tsquery('simple', ''' ' || 'center' || ' ''' || ':*')), 
        'StartSel = "<b>", StopSel = "</b>", MaxFragments = 3, MaxWords = 100, MinWords = 0, ShortWord = 4, FragmentDelimiter = "--xxx--", HighlightAll = TRUE'
      )
  ) AS .pg_title_search_highlight
FROM "lessons" 
  INNER JOIN (
    SELECT 
      "lessons"."id" AS pg_search_id, 
      (
        ts_rank(
            (to_tsvector('simple', coalesce("lessons"."name"::text, ''))),
            (to_tsquery('simple', ''' ' || 'center' || ' ''' || ':*')), 
            0
          )
      ) AS rank
    FROM 
      "lessons" 
    WHERE 
      (
        (to_tsvector('simple', coalesce("lessons"."name"::text, ''))) @@ (to_tsquery('simple', ''' ' || 'center' || ' ''' || ':*'))
      )
  ) AS pg_search_314a6b49660562c305aaf8 ON "lessons"."id" = pg_search_314a6b49660562c305aaf8.pg_search_id 
  INNER JOIN 

ORDER BY 
  pg_search_314a6b49660562c305aaf8.rank DESC, "lessons"."id" ASC
