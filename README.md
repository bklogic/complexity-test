# Complexity Test

Data access services for complexity test. It tests the capability of service engine to handle complex objects.

## Complexity Scale

### Level 0 x 0, 

The object is the same as the relational data set.

### Level 1 x 1, 

The object is different from the relational data set but does not contain any array structure.  It may include nested object structure vertically and horizontally. 

### Level 1 x n

The object includes nested array structure only vertically:

```json
{
    "id1": 1,
    "a1": [{
        "id2": 2,
        "a2": [{
            "id3": 3
              ...
        }]
    }]
}
```

### Level n x 1

The object includes nested array structure only horizontally:

```json
{
    "id1": 1,
    "a2": [{"id2": 1}],
    "a3": [{"id3": 1}]
        ...
}
```

### Level n x n

The object includes both vertically and horizontally nested array structures.

```json
[{
    "id11": 1,
    "a2": [{
                "id22": 1,
                "b2": [{
                    "id23": 1
                      ...
                }]
          }],
    "a3": [{
                "id32": 1,
                "b2": [{
                    "id33": 1
                      ...
                }]
          }]
      ...
}]
```

## Test Conditions

### Test Level

- Level 1 x 5
- Level 5 x 1, and
- Level 5 x 5

### Test Data Source

PostgreSQL database.

### Test Query

```sql
with recursive h as (
    (select 1 as level from information_schema.views limit 1)
     union all
    (select h.level+1 from information_schema.views
       join h on h.level < 8 
      limit 1)
),
t as (
  select row_number() over (order by 1) as rn from h
)
select 
  (rn-1)/4+1 as id11, 
  (rn-1)/2+1 as id22, (rn-1)/1+1 as id23,
  (rn-1)/2+1 as id32, (rn-1)/1+1 as id33
from t
```
