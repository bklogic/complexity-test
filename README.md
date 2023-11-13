# Complexity Test

Data access services for complexity test. It tests the capability of service engine to handle complex objects.

## Complexity Scale

### Level 0 x 0, 

The object is the same as the relational data set.

### Level 1 x 1, 

The object is different from the relational data set but does not con-tain any array structure.  It object may include nested object structure vertically and horizontally. 

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

## Test Levels

- Level 1 x 5
- Level 5 x 1, and
- Level 5 x 5

