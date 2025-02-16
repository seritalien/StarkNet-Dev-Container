// Import the necessary Cairo libraries
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.alloc import alloc

// Define the main function
func main{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt):
    alloc_locals
    let a = 5
    let b = 7
    let res = a + b
    return (res=res)
end
