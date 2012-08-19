namespace factor
{

#define FACTOR_CPU_STRING "arm"

//FIXME
inline static void* frame_return_address(void *frame_top)
{
	return *(void**)frame_top;
}

//FIXME
inline static void set_frame_return_address(void *frame_top, void *return_address)
{
	*(void**)frame_top = return_address;
}

//FIXME
#define CALLSTACK_BOTTOM(ctx) (void *)(0)

//FIXME
static const fixnum xt_tail_pic_offset = 0;
//FIXME
inline static void *get_call_target(cell return_address)
{
	return 0;
}

//FIXME
inline static void set_call_target(cell return_address, void *target)
{
}

//FIXME
inline static bool tail_call_site_p(cell return_address)
{
	return false;
}

//FIXME
inline static unsigned int fpu_status(unsigned int status)
{
	return 0;
}

//FIXME
//copy pasted from cpu-x86.32.hpp
/* Must match the leaf-stack-frame-size, signal-handler-stack-frame-size,
and stack-frame-size constants in cpu/x86/32/bootstrap.factor */
static const unsigned LEAF_FRAME_SIZE = 0;
static const unsigned SIGNAL_HANDLER_STACK_FRAME_SIZE = 0;
static const unsigned JIT_FRAME_SIZE = 0;
}
