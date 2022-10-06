(
    function_call
    (
        dot_index_expression
        table: (identifier)@_table_name
        field: (identifier)@_field_name
    )
    arguments: (
        arguments (_)(string("string_content")@luap)
    )
    (#eq? @_table_name "string")
    (#any-of? @_field_name "find" "gsub" "gmatch" "match")
)

(
    (
        method_index_expression
        table: (identifier)
        method: (identifier)@_method_name
    )
    (arguments(string("string_content")@luap))
    (#any-of? @_method_name "find" "gsub" "match" "gmatch")
 )
