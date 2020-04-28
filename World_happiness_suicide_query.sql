-- Both tables can't have a primary keys as their country column doesn't have unique values
-- Both tables can't have a foreign keys as well due to unique key constraint
-- Therefore, created composite primary keys with country and year for the world_happiness table
DROP TABLE world_happiness
DROP TABLE suicide

CREATE TABLE suicide (
  "country" TEXT,
  "year" INT,
  "sex" TEXT,
  "suicides_no" INT,
  "GDP_per_year" FLOAT,
  "GDP_per_capita" INT
);

CREATE TABLE world_happiness (
	"Country" VARCHAR,
	"Year" INT,
	"Life Ladder" FLOAT,
	"Social support" FLOAT,
	"Healthy life expectancy at birth" FLOAT,
	"Freedom to make life choices" FLOAT,
	"Generosity" FLOAT,
	"Perceptions of corruption" FLOAT,
	"Positive affect" FLOAT,
	"Negative affect" FLOAT,
	"Confidence in national government" FLOAT,
	"Democratic Quality" FLOAT,
	"Delivery Quality" FLOAT,
	"Standard deviation of ladder by country-year" FLOAT,
	"Standard deviation/Mean of ladder by country-year" FLOAT,
	CONSTRAINT CompKey_Country_Year_happiness PRIMARY KEY ("Country", "Year")
);

-- Testing if both the tables have been imported correctly
SELECT * FROM world_happiness
SELECT * FROM suicide

-- Both the tables can be queried as per business requirement
SELECT s."country",s."year",s."sex",s."suicides_no",s."GDP_per_year",s."GDP_per_capita",w."Life Ladder",w."Social support",
              w."Healthy life expectancy at birth",
              w."Freedom to make life choices",w."Generosity",
              w."Perceptions of corruption",w."Positive affect",
              w."Negative affect",w."Confidence in national government",
              w."Democratic Quality",w."Delivery Quality",
              w."Standard deviation of ladder by country-year",
              w."Standard deviation/Mean of ladder by country-year"
FROM suicide AS s
INNER JOIN world_happiness AS w ON (w."Country"=s."country" AND w."Year"=s."year")