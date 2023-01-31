%lang starknet


from warplib.memory import wm_read_256, wm_read_felt, wm_write_256, wm_write_felt, wm_alloc
from starkware.cairo.common.dict import dict_read, dict_write
from starkware.cairo.common.uint256 import Uint256
from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_ints import warp_external_input_check_int256, warp_external_input_check_int8
from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.starknet.common.syscalls import get_caller_address
from warplib.maths.eq import warp_eq, warp_eq256
from warplib.maths.gt import warp_gt256
from warplib.maths.add import warp_add256
from warplib.maths.sub import warp_sub256
from warplib.maths.ge import warp_ge256
from starkware.cairo.common.dict_access import DictAccess
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from warplib.maths.neq import warp_neq256


struct Vote_a1796658{
    amount : Uint256,
    position : felt,
}


struct Proposal_2cb16fd2{
    pro : Uint256,
    against : Uint256,
    abstain : Uint256,
    votes : felt,
    result : felt,
}


struct User_ba076238{
    total_balance : Uint256,
    total_availible : Uint256,
    total_power : Uint256,
    delegates : felt,
}


func WM0_Vote_a1796658_amount(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WM1_Vote_a1796658_position(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func wm_to_storage0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(loc : felt, mem_loc: felt) -> (loc: felt){
    alloc_locals;
let (elem_mem_loc_0) = dict_read{dict_ptr=warp_memory}(mem_loc);
WARP_STORAGE.write(loc, elem_mem_loc_0);
let (elem_mem_loc_1) = dict_read{dict_ptr=warp_memory}(mem_loc + 1);
WARP_STORAGE.write(loc + 1, elem_mem_loc_1);
let (elem_mem_loc_2) = dict_read{dict_ptr=warp_memory}(mem_loc + 2);
WARP_STORAGE.write(loc + 2, elem_mem_loc_2);
    return (loc,);
}

func WSM0_Proposal_2cb16fd2_pro(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM1_Proposal_2cb16fd2_against(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM2_Proposal_2cb16fd2_abstain(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
}

func WSM3_Proposal_2cb16fd2_result(loc: felt) -> (memberLoc: felt){
    return (loc + 7,);
}

func WSM8_Proposal_2cb16fd2_votes(loc: felt) -> (memberLoc: felt){
    return (loc + 6,);
}

func WSM4_User_ba076238_total_availible(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM5_User_ba076238_total_balance(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM6_User_ba076238_delegates(loc: felt) -> (memberLoc: felt){
    return (loc + 6,);
}

func WSM7_User_ba076238_total_power(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
}

func WSM9_Vote_a1796658_amount(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM10_Vote_a1796658_position(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WS0_READ_warp_id{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = readId(loc);
    return (read0,);
}

func WS1_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS2_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: Uint256){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    let (read1) = WARP_STORAGE.read(loc + 1);
    return (Uint256(low=read0,high=read1),);
}

func ws_to_memory0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(loc : felt) -> (mem_loc: felt){
    alloc_locals;
    let (mem_start) = wm_alloc(Uint256(0x3, 0x0));
let (copy0) = WARP_STORAGE.read(loc);
dict_write{dict_ptr=warp_memory}(mem_start, copy0);
let (copy1) = WARP_STORAGE.read(loc + 1);
dict_write{dict_ptr=warp_memory}(mem_start + 1, copy1);
let (copy2) = WARP_STORAGE.read(loc + 2);
dict_write{dict_ptr=warp_memory}(mem_start + 2, copy2);
    return (mem_start,);
}

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
}

func WS_WRITE1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: Uint256) -> (res: Uint256){
    WARP_STORAGE.write(loc, value.low);
    WARP_STORAGE.write(loc + 1, value.high);
    return (value,);
}

@storage_var
func WARP_MAPPING0(name: felt, index: Uint256) -> (resLoc : felt){
}
func WS0_INDEX_Uint256_to_Proposal_2cb16fd2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: Uint256) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING0.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 8);
        WARP_MAPPING0.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}

@storage_var
func WARP_MAPPING1(name: felt, index: felt) -> (resLoc : felt){
}
func WS1_INDEX_felt_to_User_ba076238{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING1.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 7);
        WARP_MAPPING1.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}

@storage_var
func WARP_MAPPING2(name: felt, index: felt) -> (resLoc : felt){
}
func WS2_INDEX_felt_to_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING2.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 2);
        WARP_MAPPING2.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}

@storage_var
func WARP_MAPPING3(name: felt, index: felt) -> (resLoc : felt){
}
func WS3_INDEX_felt_to_Vote_a1796658{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING3.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 3);
        WARP_MAPPING3.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}


// Contract Def Multi_Vote


namespace Multi_Vote{

    // Dynamic variables - Arrays and Maps

    const __warp_3_proposals = 1;

    const __warp_4_users = 2;

    // Static variables

    const __warp_0_curr_proposal = 0;

    const __warp_1_vote_in_progress = 2;

    const __warp_2_total_supply = 3;

    const __warp_5_owner = 7;


    func __warp_modifier_onlyOwner_end_vote_1f6933c3_5{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_parameter_result_m_capture3 : felt)-> (__warp_ret_parameter_result4 : felt){
    alloc_locals;


        
        let __warp_ret_parameter_result4 = 0;
        
        let (__warp_se_0) = WS1_READ_felt(__warp_5_owner);
        
        let (__warp_se_1) = get_caller_address();
        
        let (__warp_se_2) = warp_eq(__warp_se_0, __warp_se_1);
        
        with_attr error_message("Ownable: caller is not the owner"){
            assert __warp_se_2 = 1;
        }
        
        let (__warp_pse_0) = __warp_original_function_end_vote_1f6933c3_2(__warp_parameter_result_m_capture3);
        
        let __warp_ret_parameter_result4 = __warp_pse_0;
        
        
        
        return (__warp_ret_parameter_result4,);

    }


    func __warp_conditional___warp_original_function_end_vote_1f6933c3_2_1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_27_proposal : felt)-> (__warp_rc_0 : felt, __warp_27_proposal : felt){
    alloc_locals;


        
        let (__warp_se_3) = WSM0_Proposal_2cb16fd2_pro(__warp_27_proposal);
        
        let (__warp_se_4) = WS2_READ_Uint256(__warp_se_3);
        
        let (__warp_se_5) = WSM1_Proposal_2cb16fd2_against(__warp_27_proposal);
        
        let (__warp_se_6) = WS2_READ_Uint256(__warp_se_5);
        
        let (__warp_se_7) = warp_gt256(__warp_se_4, __warp_se_6);
        
        if (__warp_se_7 != 0){
        
            
            let (__warp_se_8) = WSM0_Proposal_2cb16fd2_pro(__warp_27_proposal);
            
            let (__warp_se_9) = WS2_READ_Uint256(__warp_se_8);
            
            let (__warp_se_10) = WSM2_Proposal_2cb16fd2_abstain(__warp_27_proposal);
            
            let (__warp_se_11) = WS2_READ_Uint256(__warp_se_10);
            
            let (__warp_se_12) = warp_gt256(__warp_se_9, __warp_se_11);
            
            let __warp_rc_0 = __warp_se_12;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_27_proposal = __warp_27_proposal;
            
            
            
            return (__warp_rc_0, __warp_27_proposal);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_27_proposal = __warp_27_proposal;
            
            
            
            return (__warp_rc_0, __warp_27_proposal);
        }

    }


    func __warp_conditional___warp_original_function_end_vote_1f6933c3_2_3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_27_proposal : felt)-> (__warp_rc_2 : felt, __warp_27_proposal : felt){
    alloc_locals;


        
        let (__warp_se_13) = WSM1_Proposal_2cb16fd2_against(__warp_27_proposal);
        
        let (__warp_se_14) = WS2_READ_Uint256(__warp_se_13);
        
        let (__warp_se_15) = WSM0_Proposal_2cb16fd2_pro(__warp_27_proposal);
        
        let (__warp_se_16) = WS2_READ_Uint256(__warp_se_15);
        
        let (__warp_se_17) = warp_gt256(__warp_se_14, __warp_se_16);
        
        if (__warp_se_17 != 0){
        
            
            let (__warp_se_18) = WSM1_Proposal_2cb16fd2_against(__warp_27_proposal);
            
            let (__warp_se_19) = WS2_READ_Uint256(__warp_se_18);
            
            let (__warp_se_20) = WSM2_Proposal_2cb16fd2_abstain(__warp_27_proposal);
            
            let (__warp_se_21) = WS2_READ_Uint256(__warp_se_20);
            
            let (__warp_se_22) = warp_gt256(__warp_se_19, __warp_se_21);
            
            let __warp_rc_2 = __warp_se_22;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_27_proposal = __warp_27_proposal;
            
            
            
            return (__warp_rc_2, __warp_27_proposal);
        }else{
        
            
            let __warp_rc_2 = 0;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_27_proposal = __warp_27_proposal;
            
            
            
            return (__warp_rc_2, __warp_27_proposal);
        }

    }


    func __warp_original_function_end_vote_1f6933c3_2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(result_m_capture : felt)-> (result : felt){
    alloc_locals;


        
        let result = 0;
        
        let result = result_m_capture;
        
        let (__warp_se_23) = WS1_READ_felt(__warp_1_vote_in_progress);
        
        with_attr error_message("vote not in progress"){
            assert __warp_se_23 = 1;
        }
        
        let (__warp_se_24) = WS2_READ_Uint256(__warp_0_curr_proposal);
        
        let (__warp_27_proposal) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(__warp_3_proposals, __warp_se_24);
        
        WS_WRITE0(__warp_1_vote_in_progress, 0);
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_0, __warp_td_0) = __warp_conditional___warp_original_function_end_vote_1f6933c3_2_1(__warp_27_proposal);
            
            let __warp_tv_1 = __warp_td_0;
            
            let __warp_27_proposal = __warp_tv_1;
            
            let __warp_rc_0 = __warp_tv_0;
        
        if (__warp_rc_0 != 0){
        
            
            let (__warp_se_25) = WSM3_Proposal_2cb16fd2_result(__warp_27_proposal);
            
            WS_WRITE0(__warp_se_25, 1);
            
            
            
            return (1,);
        }else{
        
            
            let __warp_rc_2 = 0;
            
                
                let (__warp_tv_2, __warp_td_1) = __warp_conditional___warp_original_function_end_vote_1f6933c3_2_3(__warp_27_proposal);
                
                let __warp_tv_3 = __warp_td_1;
                
                let __warp_27_proposal = __warp_tv_3;
                
                let __warp_rc_2 = __warp_tv_2;
            
            if (__warp_rc_2 != 0){
            
                
                let (__warp_se_26) = WSM3_Proposal_2cb16fd2_result(__warp_27_proposal);
                
                WS_WRITE0(__warp_se_26, 2);
                
                
                
                return (2,);
            }else{
            
                
                let (__warp_se_27) = WSM3_Proposal_2cb16fd2_result(__warp_27_proposal);
                
                WS_WRITE0(__warp_se_27, 3);
                
                
                
                return (3,);
            }
        }

    }


    func __warp_modifier_onlyOwner_propose_c198f8ba_1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}()-> (){
    alloc_locals;


        
        let (__warp_se_28) = WS1_READ_felt(__warp_5_owner);
        
        let (__warp_se_29) = get_caller_address();
        
        let (__warp_se_30) = warp_eq(__warp_se_28, __warp_se_29);
        
        with_attr error_message("Ownable: caller is not the owner"){
            assert __warp_se_30 = 1;
        }
        
        __warp_original_function_propose_c198f8ba_0();
        
        
        
        return ();

    }


    func __warp_original_function_propose_c198f8ba_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}()-> (){
    alloc_locals;


        
        let (__warp_se_31) = WS1_READ_felt(__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert 1 - __warp_se_31 = 1;
        }
        
        let (__warp_se_32) = WS2_READ_Uint256(__warp_0_curr_proposal);
        
        let (__warp_se_33) = warp_add256(__warp_se_32, Uint256(low=1, high=0));
        
        let (__warp_se_34) = WS_WRITE1(__warp_0_curr_proposal, __warp_se_33);
        
        warp_sub256(__warp_se_34, Uint256(low=1, high=0));
        
        WS_WRITE0(__warp_1_vote_in_progress, 1);
        
        
        
        return ();

    }


    func __warp_constructor_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_6__total_supply : Uint256)-> (){
    alloc_locals;


        
        WS_WRITE1(__warp_2_total_supply, __warp_6__total_supply);
        
        let (__warp_7__from) = get_caller_address();
        
        let (__warp_8_from_user) = WS1_INDEX_felt_to_User_ba076238(__warp_4_users, __warp_7__from);
        
        let (__warp_se_35) = WSM4_User_ba076238_total_availible(__warp_8_from_user);
        
        let (__warp_se_36) = WSM4_User_ba076238_total_availible(__warp_8_from_user);
        
        let (__warp_se_37) = WS2_READ_Uint256(__warp_se_36);
        
        let (__warp_se_38) = warp_add256(__warp_se_37, __warp_6__total_supply);
        
        WS_WRITE1(__warp_se_35, __warp_se_38);
        
        let (__warp_se_39) = WSM5_User_ba076238_total_balance(__warp_8_from_user);
        
        let (__warp_se_40) = WSM5_User_ba076238_total_balance(__warp_8_from_user);
        
        let (__warp_se_41) = WS2_READ_Uint256(__warp_se_40);
        
        let (__warp_se_42) = warp_add256(__warp_se_41, __warp_6__total_supply);
        
        WS_WRITE1(__warp_se_39, __warp_se_42);
        
        let (__warp_se_43) = get_caller_address();
        
        WS_WRITE0(__warp_5_owner, __warp_se_43);
        
        
        
        return ();

    }


    func __warp_conditional___warp_conditional_vote_d3f29ace_5_7(__warp_28__position : felt)-> (__warp_rc_6 : felt, __warp_28__position : felt){
    alloc_locals;


        
        let (__warp_se_101) = warp_eq(__warp_28__position, 1);
        
        if (__warp_se_101 != 0){
        
            
            let __warp_rc_6 = 1;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_28__position = __warp_28__position;
            
            
            
            return (__warp_rc_6, __warp_28__position);
        }else{
        
            
            let (__warp_se_102) = warp_eq(__warp_28__position, 2);
            
            let __warp_rc_6 = __warp_se_102;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_28__position = __warp_28__position;
            
            
            
            return (__warp_rc_6, __warp_28__position);
        }

    }


    func __warp_conditional_vote_d3f29ace_5(__warp_28__position : felt)-> (__warp_rc_4 : felt, __warp_28__position : felt){
    alloc_locals;


        
        let __warp_rc_6 = 0;
        
            
            let (__warp_tv_4, __warp_tv_5) = __warp_conditional___warp_conditional_vote_d3f29ace_5_7(__warp_28__position);
            
            let __warp_28__position = __warp_tv_5;
            
            let __warp_rc_6 = __warp_tv_4;
        
        if (__warp_rc_6 != 0){
        
            
            let __warp_rc_4 = 1;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_28__position = __warp_28__position;
            
            
            
            return (__warp_rc_4, __warp_28__position);
        }else{
        
            
            let (__warp_se_103) = warp_eq(__warp_28__position, 3);
            
            let __warp_rc_4 = __warp_se_103;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_28__position = __warp_28__position;
            
            
            
            return (__warp_rc_4, __warp_28__position);
        }

    }


    func vote_d3f29ace_if_part2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_31_proposal : felt, __warp_30__from : felt, __warp_32_from_vote : felt)-> (){
    alloc_locals;


        
        
        
        vote_d3f29ace_if_part1(__warp_31_proposal, __warp_30__from, __warp_32_from_vote);
        
        let __warp_uv7 = ();
        
        
        
        return ();

    }


    func vote_d3f29ace_if_part1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_31_proposal : felt, __warp_30__from : felt, __warp_32_from_vote : felt)-> (){
    alloc_locals;


        
        let (__warp_se_131) = WSM8_Proposal_2cb16fd2_votes(__warp_31_proposal);
        
        let (__warp_se_132) = WS0_READ_warp_id(__warp_se_131);
        
        let (__warp_se_133) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_132, __warp_30__from);
        
        wm_to_storage0(__warp_se_133, __warp_32_from_vote);
        
        
        
        return ();

    }


    func unVote_2c70d64e_if_part2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_36_from_vote : felt, __warp_35_proposal : felt, __warp_34__from : felt)-> (){
    alloc_locals;


        
        
        
        unVote_2c70d64e_if_part1(__warp_36_from_vote, __warp_35_proposal, __warp_34__from);
        
        let __warp_uv8 = ();
        
        
        
        return ();

    }


    func unVote_2c70d64e_if_part1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_36_from_vote : felt, __warp_35_proposal : felt, __warp_34__from : felt)-> (){
    alloc_locals;


        
        let (__warp_se_156) = WM0_Vote_a1796658_amount(__warp_36_from_vote);
        
        wm_write_256(__warp_se_156, Uint256(low=0, high=0));
        
        let (__warp_se_157) = WM1_Vote_a1796658_position(__warp_36_from_vote);
        
        wm_write_felt(__warp_se_157, 0);
        
        let (__warp_se_158) = WSM8_Proposal_2cb16fd2_votes(__warp_35_proposal);
        
        let (__warp_se_159) = WS0_READ_warp_id(__warp_se_158);
        
        let (__warp_se_160) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_159, __warp_34__from);
        
        wm_to_storage0(__warp_se_160, __warp_36_from_vote);
        
        
        
        return ();

    }

}


    @external
    func transferTo_2ccb1b30{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_9__to : felt, __warp_10__amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_10__amount);
        
        warp_external_input_check_address(__warp_9__to);
        
        let (__warp_11__from) = get_caller_address();
        
        let (__warp_12_from_user) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_11__from);
        
        let (__warp_se_44) = WSM4_User_ba076238_total_availible(__warp_12_from_user);
        
        let (__warp_13_total_availible) = WS2_READ_Uint256(__warp_se_44);
        
        let (__warp_se_45) = warp_ge256(__warp_13_total_availible, __warp_10__amount);
        
        with_attr error_message("not enough votes"){
            assert __warp_se_45 = 1;
        }
        
        let (__warp_14_to_user) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_9__to);
        
        let (__warp_se_46) = WSM4_User_ba076238_total_availible(__warp_12_from_user);
        
        let (__warp_se_47) = WSM4_User_ba076238_total_availible(__warp_12_from_user);
        
        let (__warp_se_48) = WS2_READ_Uint256(__warp_se_47);
        
        let (__warp_se_49) = warp_sub256(__warp_se_48, __warp_10__amount);
        
        WS_WRITE1(__warp_se_46, __warp_se_49);
        
        let (__warp_se_50) = WSM4_User_ba076238_total_availible(__warp_14_to_user);
        
        let (__warp_se_51) = WSM4_User_ba076238_total_availible(__warp_14_to_user);
        
        let (__warp_se_52) = WS2_READ_Uint256(__warp_se_51);
        
        let (__warp_se_53) = warp_add256(__warp_se_52, __warp_10__amount);
        
        WS_WRITE1(__warp_se_50, __warp_se_53);
        
        let (__warp_se_54) = WSM5_User_ba076238_total_balance(__warp_12_from_user);
        
        let (__warp_se_55) = WSM5_User_ba076238_total_balance(__warp_12_from_user);
        
        let (__warp_se_56) = WS2_READ_Uint256(__warp_se_55);
        
        let (__warp_se_57) = warp_sub256(__warp_se_56, __warp_10__amount);
        
        WS_WRITE1(__warp_se_54, __warp_se_57);
        
        let (__warp_se_58) = WSM5_User_ba076238_total_balance(__warp_14_to_user);
        
        let (__warp_se_59) = WSM5_User_ba076238_total_balance(__warp_14_to_user);
        
        let (__warp_se_60) = WS2_READ_Uint256(__warp_se_59);
        
        let (__warp_se_61) = warp_add256(__warp_se_60, __warp_10__amount);
        
        WS_WRITE1(__warp_se_58, __warp_se_61);
        
        
        
        return ();

    }


    @external
    func delegateTo_8bcd4620{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_15__to : felt, __warp_16__amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_16__amount);
        
        warp_external_input_check_address(__warp_15__to);
        
        let (__warp_17__from) = get_caller_address();
        
        let (__warp_18_from_user) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_17__from);
        
        let (__warp_se_62) = WSM4_User_ba076238_total_availible(__warp_18_from_user);
        
        let (__warp_19_total_availible) = WS2_READ_Uint256(__warp_se_62);
        
        let (__warp_se_63) = warp_ge256(__warp_19_total_availible, __warp_16__amount);
        
        with_attr error_message("not enough votes availible"){
            assert __warp_se_63 = 1;
        }
        
        let (__warp_20_to_user) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_15__to);
        
        let (__warp_se_64) = WSM4_User_ba076238_total_availible(__warp_18_from_user);
        
        let (__warp_se_65) = WSM4_User_ba076238_total_availible(__warp_18_from_user);
        
        let (__warp_se_66) = WS2_READ_Uint256(__warp_se_65);
        
        let (__warp_se_67) = warp_sub256(__warp_se_66, __warp_16__amount);
        
        WS_WRITE1(__warp_se_64, __warp_se_67);
        
        let __warp_cs_0 = __warp_15__to;
        
        let (__warp_se_68) = WSM6_User_ba076238_delegates(__warp_18_from_user);
        
        let (__warp_se_69) = WS0_READ_warp_id(__warp_se_68);
        
        let (__warp_se_70) = WS2_INDEX_felt_to_Uint256(__warp_se_69, __warp_cs_0);
        
        let (__warp_se_71) = WSM6_User_ba076238_delegates(__warp_18_from_user);
        
        let (__warp_se_72) = WS0_READ_warp_id(__warp_se_71);
        
        let (__warp_se_73) = WS2_INDEX_felt_to_Uint256(__warp_se_72, __warp_cs_0);
        
        let (__warp_se_74) = WS2_READ_Uint256(__warp_se_73);
        
        let (__warp_se_75) = warp_add256(__warp_se_74, __warp_16__amount);
        
        WS_WRITE1(__warp_se_70, __warp_se_75);
        
        let (__warp_se_76) = WSM7_User_ba076238_total_power(__warp_20_to_user);
        
        let (__warp_se_77) = WSM7_User_ba076238_total_power(__warp_20_to_user);
        
        let (__warp_se_78) = WS2_READ_Uint256(__warp_se_77);
        
        let (__warp_se_79) = warp_add256(__warp_se_78, __warp_16__amount);
        
        WS_WRITE1(__warp_se_76, __warp_se_79);
        
        
        
        return ();

    }


    @external
    func undelegate_4d99dd16{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_21__to : felt, __warp_22__amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_22__amount);
        
        warp_external_input_check_address(__warp_21__to);
        
        let (__warp_se_80) = WS1_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert 1 - __warp_se_80 = 1;
        }
        
        let (__warp_23__from) = get_caller_address();
        
        let (__warp_24_from_user) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_23__from);
        
        let (__warp_se_81) = WSM6_User_ba076238_delegates(__warp_24_from_user);
        
        let (__warp_se_82) = WS0_READ_warp_id(__warp_se_81);
        
        let (__warp_se_83) = WS2_INDEX_felt_to_Uint256(__warp_se_82, __warp_21__to);
        
        let (__warp_25_current_delgated) = WS2_READ_Uint256(__warp_se_83);
        
        let (__warp_se_84) = warp_ge256(__warp_25_current_delgated, __warp_22__amount);
        
        with_attr error_message("undelgating more than balance"){
            assert __warp_se_84 = 1;
        }
        
        let (__warp_26_to_user) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_21__to);
        
        let (__warp_se_85) = WSM4_User_ba076238_total_availible(__warp_24_from_user);
        
        let (__warp_se_86) = WSM4_User_ba076238_total_availible(__warp_24_from_user);
        
        let (__warp_se_87) = WS2_READ_Uint256(__warp_se_86);
        
        let (__warp_se_88) = warp_add256(__warp_se_87, __warp_22__amount);
        
        WS_WRITE1(__warp_se_85, __warp_se_88);
        
        let __warp_cs_1 = __warp_21__to;
        
        let (__warp_se_89) = WSM6_User_ba076238_delegates(__warp_24_from_user);
        
        let (__warp_se_90) = WS0_READ_warp_id(__warp_se_89);
        
        let (__warp_se_91) = WS2_INDEX_felt_to_Uint256(__warp_se_90, __warp_cs_1);
        
        let (__warp_se_92) = WSM6_User_ba076238_delegates(__warp_24_from_user);
        
        let (__warp_se_93) = WS0_READ_warp_id(__warp_se_92);
        
        let (__warp_se_94) = WS2_INDEX_felt_to_Uint256(__warp_se_93, __warp_cs_1);
        
        let (__warp_se_95) = WS2_READ_Uint256(__warp_se_94);
        
        let (__warp_se_96) = warp_sub256(__warp_se_95, __warp_22__amount);
        
        WS_WRITE1(__warp_se_91, __warp_se_96);
        
        let (__warp_se_97) = WSM7_User_ba076238_total_power(__warp_26_to_user);
        
        let (__warp_se_98) = WSM7_User_ba076238_total_power(__warp_26_to_user);
        
        let (__warp_se_99) = WS2_READ_Uint256(__warp_se_98);
        
        let (__warp_se_100) = warp_sub256(__warp_se_99, __warp_22__amount);
        
        WS_WRITE1(__warp_se_97, __warp_se_100);
        
        
        
        return ();

    }


    @external
    func propose_c198f8ba{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}()-> (){
    alloc_locals;


        
        Multi_Vote.__warp_modifier_onlyOwner_propose_c198f8ba_1();
        
        let __warp_uv0 = ();
        
        
        
        return ();

    }


    @external
    func end_vote_1f6933c3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (result : felt){
    alloc_locals;


        
        let result = 0;
        
        let (__warp_pse_1) = Multi_Vote.__warp_modifier_onlyOwner_end_vote_1f6933c3_5(result);
        
        
        
        return (__warp_pse_1,);

    }


    @external
    func vote_d3f29ace{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_28__position : felt, __warp_29__amount : Uint256)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int256(__warp_29__amount);
        
        warp_external_input_check_int8(__warp_28__position);
        
        let (__warp_se_104) = WS1_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert __warp_se_104 = 1;
        }
        
        let __warp_rc_4 = 0;
        
            
            let (__warp_tv_6, __warp_tv_7) = Multi_Vote.__warp_conditional_vote_d3f29ace_5(__warp_28__position);
            
            let __warp_28__position = __warp_tv_7;
            
            let __warp_rc_4 = __warp_tv_6;
        
        with_attr error_message("vote not valid"){
            assert __warp_rc_4 = 1;
        }
        
        let (__warp_30__from) = get_caller_address();
        
        let (__warp_se_105) = WS2_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        let (__warp_31_proposal) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_se_105);
        
        let (__warp_se_106) = WSM8_Proposal_2cb16fd2_votes(__warp_31_proposal);
        
        let (__warp_se_107) = WS0_READ_warp_id(__warp_se_106);
        
        let (__warp_se_108) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_107, __warp_30__from);
        
        let (__warp_32_from_vote) = ws_to_memory0(__warp_se_108);
        
        let (__warp_se_109) = WM0_Vote_a1796658_amount(__warp_32_from_vote);
        
        let (__warp_se_110) = wm_read_256(__warp_se_109);
        
        let (__warp_se_111) = warp_eq256(__warp_se_110, Uint256(low=0, high=0));
        
        with_attr error_message("already voted"){
            assert __warp_se_111 = 1;
        }
        
        let (__warp_se_112) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_30__from);
        
        let (__warp_se_113) = WSM7_User_ba076238_total_power(__warp_se_112);
        
        let (__warp_33_total_power) = WS2_READ_Uint256(__warp_se_113);
        
        let (__warp_se_114) = warp_ge256(__warp_33_total_power, __warp_29__amount);
        
        with_attr error_message("not enough votes availible"){
            assert __warp_se_114 = 1;
        }
        
        let (__warp_se_115) = WM0_Vote_a1796658_amount(__warp_32_from_vote);
        
        wm_write_256(__warp_se_115, __warp_29__amount);
        
        let (__warp_se_116) = WM1_Vote_a1796658_position(__warp_32_from_vote);
        
        wm_write_felt(__warp_se_116, __warp_28__position);
        
        let (__warp_se_117) = warp_eq(__warp_28__position, 1);
        
        if (__warp_se_117 != 0){
        
            
                
                let (__warp_se_118) = WSM0_Proposal_2cb16fd2_pro(__warp_31_proposal);
                
                let (__warp_se_119) = WSM0_Proposal_2cb16fd2_pro(__warp_31_proposal);
                
                let (__warp_se_120) = WS2_READ_Uint256(__warp_se_119);
                
                let (__warp_se_121) = warp_add256(__warp_se_120, __warp_29__amount);
                
                WS_WRITE1(__warp_se_118, __warp_se_121);
            
            Multi_Vote.vote_d3f29ace_if_part1(__warp_31_proposal, __warp_30__from, __warp_32_from_vote);
            
            let __warp_uv1 = ();
            
            default_dict_finalize(warp_memory_start, warp_memory, 0);
            
            
            return ();
        }else{
        
            
                
                let (__warp_se_122) = warp_eq(__warp_28__position, 2);
                
                if (__warp_se_122 != 0){
                
                    
                        
                        let (__warp_se_123) = WSM1_Proposal_2cb16fd2_against(__warp_31_proposal);
                        
                        let (__warp_se_124) = WSM1_Proposal_2cb16fd2_against(__warp_31_proposal);
                        
                        let (__warp_se_125) = WS2_READ_Uint256(__warp_se_124);
                        
                        let (__warp_se_126) = warp_add256(__warp_se_125, __warp_29__amount);
                        
                        WS_WRITE1(__warp_se_123, __warp_se_126);
                    
                    Multi_Vote.vote_d3f29ace_if_part2(__warp_31_proposal, __warp_30__from, __warp_32_from_vote);
                    
                    let __warp_uv2 = ();
                    
                    default_dict_finalize(warp_memory_start, warp_memory, 0);
                    
                    
                    return ();
                }else{
                
                    
                        
                        let (__warp_se_127) = WSM2_Proposal_2cb16fd2_abstain(__warp_31_proposal);
                        
                        let (__warp_se_128) = WSM2_Proposal_2cb16fd2_abstain(__warp_31_proposal);
                        
                        let (__warp_se_129) = WS2_READ_Uint256(__warp_se_128);
                        
                        let (__warp_se_130) = warp_add256(__warp_se_129, __warp_29__amount);
                        
                        WS_WRITE1(__warp_se_127, __warp_se_130);
                    
                    Multi_Vote.vote_d3f29ace_if_part2(__warp_31_proposal, __warp_30__from, __warp_32_from_vote);
                    
                    let __warp_uv3 = ();
                    
                    default_dict_finalize(warp_memory_start, warp_memory, 0);
                    
                    
                    return ();
                }
        }
    }
    }


    @external
    func unVote_2c70d64e{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}()-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        let (__warp_se_134) = WS1_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert __warp_se_134 = 1;
        }
        
        let (__warp_34__from) = get_caller_address();
        
        let (__warp_se_135) = WS2_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        let (__warp_35_proposal) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_se_135);
        
        let (__warp_se_136) = WSM8_Proposal_2cb16fd2_votes(__warp_35_proposal);
        
        let (__warp_se_137) = WS0_READ_warp_id(__warp_se_136);
        
        let (__warp_se_138) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_137, __warp_34__from);
        
        let (__warp_36_from_vote) = ws_to_memory0(__warp_se_138);
        
        let (__warp_se_139) = WM1_Vote_a1796658_position(__warp_36_from_vote);
        
        let (__warp_37_position) = wm_read_felt(__warp_se_139);
        
        let (__warp_se_140) = WM0_Vote_a1796658_amount(__warp_36_from_vote);
        
        let (__warp_38_total_amount) = wm_read_256(__warp_se_140);
        
        let (__warp_se_141) = warp_neq256(__warp_38_total_amount, Uint256(low=0, high=0));
        
        with_attr error_message("not voted yet"){
            assert __warp_se_141 = 1;
        }
        
        let (__warp_se_142) = warp_eq(__warp_37_position, 1);
        
        if (__warp_se_142 != 0){
        
            
                
                let (__warp_se_143) = WSM0_Proposal_2cb16fd2_pro(__warp_35_proposal);
                
                let (__warp_se_144) = WSM0_Proposal_2cb16fd2_pro(__warp_35_proposal);
                
                let (__warp_se_145) = WS2_READ_Uint256(__warp_se_144);
                
                let (__warp_se_146) = warp_sub256(__warp_se_145, __warp_38_total_amount);
                
                WS_WRITE1(__warp_se_143, __warp_se_146);
            
            Multi_Vote.unVote_2c70d64e_if_part1(__warp_36_from_vote, __warp_35_proposal, __warp_34__from);
            
            let __warp_uv4 = ();
            
            default_dict_finalize(warp_memory_start, warp_memory, 0);
            
            
            return ();
        }else{
        
            
                
                let (__warp_se_147) = warp_eq(__warp_37_position, 2);
                
                if (__warp_se_147 != 0){
                
                    
                        
                        let (__warp_se_148) = WSM1_Proposal_2cb16fd2_against(__warp_35_proposal);
                        
                        let (__warp_se_149) = WSM1_Proposal_2cb16fd2_against(__warp_35_proposal);
                        
                        let (__warp_se_150) = WS2_READ_Uint256(__warp_se_149);
                        
                        let (__warp_se_151) = warp_sub256(__warp_se_150, __warp_38_total_amount);
                        
                        WS_WRITE1(__warp_se_148, __warp_se_151);
                    
                    Multi_Vote.unVote_2c70d64e_if_part2(__warp_36_from_vote, __warp_35_proposal, __warp_34__from);
                    
                    let __warp_uv5 = ();
                    
                    default_dict_finalize(warp_memory_start, warp_memory, 0);
                    
                    
                    return ();
                }else{
                
                    
                        
                        let (__warp_se_152) = WSM2_Proposal_2cb16fd2_abstain(__warp_35_proposal);
                        
                        let (__warp_se_153) = WSM2_Proposal_2cb16fd2_abstain(__warp_35_proposal);
                        
                        let (__warp_se_154) = WS2_READ_Uint256(__warp_se_153);
                        
                        let (__warp_se_155) = warp_sub256(__warp_se_154, __warp_38_total_amount);
                        
                        WS_WRITE1(__warp_se_152, __warp_se_155);
                    
                    Multi_Vote.unVote_2c70d64e_if_part2(__warp_36_from_vote, __warp_35_proposal, __warp_34__from);
                    
                    let __warp_uv6 = ();
                    
                    default_dict_finalize(warp_memory_start, warp_memory, 0);
                    
                    
                    return ();
                }
        }
    }
    }


    @view
    func get_curr_proposal_ca3adffc{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_39 : Uint256){
    alloc_locals;


        
        let (__warp_se_161) = WS2_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        
        
        return (__warp_se_161,);

    }


    @view
    func get_vote_in_progress_e72997a8{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_40 : felt){
    alloc_locals;


        
        let (__warp_se_162) = WS1_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        
        
        return (__warp_se_162,);

    }


    @view
    func get_total_supply_f923058c{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_41 : Uint256){
    alloc_locals;


        
        let (__warp_se_163) = WS2_READ_Uint256(Multi_Vote.__warp_2_total_supply);
        
        
        
        return (__warp_se_163,);

    }


    @view
    func get_proposal_pro_df6578be{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_42__proposal : Uint256)-> (__warp_43 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_42__proposal);
        
        let (__warp_se_164) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_42__proposal);
        
        let (__warp_se_165) = WSM0_Proposal_2cb16fd2_pro(__warp_se_164);
        
        let (__warp_se_166) = WS2_READ_Uint256(__warp_se_165);
        
        
        
        return (__warp_se_166,);

    }


    @view
    func get_proposal_against_b3897a04{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_44__proposal : Uint256)-> (__warp_45 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_44__proposal);
        
        let (__warp_se_167) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_44__proposal);
        
        let (__warp_se_168) = WSM1_Proposal_2cb16fd2_against(__warp_se_167);
        
        let (__warp_se_169) = WS2_READ_Uint256(__warp_se_168);
        
        
        
        return (__warp_se_169,);

    }


    @view
    func get_proposal_abstain_ddaeb1d0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_46__proposal : Uint256)-> (__warp_47 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_46__proposal);
        
        let (__warp_se_170) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_46__proposal);
        
        let (__warp_se_171) = WSM2_Proposal_2cb16fd2_abstain(__warp_se_170);
        
        let (__warp_se_172) = WS2_READ_Uint256(__warp_se_171);
        
        
        
        return (__warp_se_172,);

    }


    @view
    func get_proposal_result_e5302c2f{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_48__proposal : Uint256)-> (__warp_49 : felt){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_48__proposal);
        
        let (__warp_se_173) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_48__proposal);
        
        let (__warp_se_174) = WSM3_Proposal_2cb16fd2_result(__warp_se_173);
        
        let (__warp_se_175) = WS1_READ_felt(__warp_se_174);
        
        
        
        return (__warp_se_175,);

    }


    @view
    func get_vote_amount_3bd5be94{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_50__proposal : Uint256, __warp_51_voter : felt)-> (__warp_52 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_51_voter);
        
        warp_external_input_check_int256(__warp_50__proposal);
        
        let (__warp_se_176) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_50__proposal);
        
        let (__warp_se_177) = WSM8_Proposal_2cb16fd2_votes(__warp_se_176);
        
        let (__warp_se_178) = WS0_READ_warp_id(__warp_se_177);
        
        let (__warp_se_179) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_178, __warp_51_voter);
        
        let (__warp_se_180) = WSM9_Vote_a1796658_amount(__warp_se_179);
        
        let (__warp_se_181) = WS2_READ_Uint256(__warp_se_180);
        
        
        
        return (__warp_se_181,);

    }


    @view
    func get_vote_position_d81aeb20{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_53__proposal : Uint256, __warp_54_voter : felt)-> (__warp_55 : felt){
    alloc_locals;


        
        warp_external_input_check_address(__warp_54_voter);
        
        warp_external_input_check_int256(__warp_53__proposal);
        
        let (__warp_se_182) = WS0_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_53__proposal);
        
        let (__warp_se_183) = WSM8_Proposal_2cb16fd2_votes(__warp_se_182);
        
        let (__warp_se_184) = WS0_READ_warp_id(__warp_se_183);
        
        let (__warp_se_185) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_184, __warp_54_voter);
        
        let (__warp_se_186) = WSM10_Vote_a1796658_position(__warp_se_185);
        
        let (__warp_se_187) = WS1_READ_felt(__warp_se_186);
        
        
        
        return (__warp_se_187,);

    }


    @view
    func get_user_total_balance_b39649ea{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_56_user : felt)-> (__warp_57 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_56_user);
        
        let (__warp_se_188) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_56_user);
        
        let (__warp_se_189) = WSM5_User_ba076238_total_balance(__warp_se_188);
        
        let (__warp_se_190) = WS2_READ_Uint256(__warp_se_189);
        
        
        
        return (__warp_se_190,);

    }


    @view
    func get_user_total_availible_1cd6e9b8{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_58_user : felt)-> (__warp_59 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_58_user);
        
        let (__warp_se_191) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_58_user);
        
        let (__warp_se_192) = WSM4_User_ba076238_total_availible(__warp_se_191);
        
        let (__warp_se_193) = WS2_READ_Uint256(__warp_se_192);
        
        
        
        return (__warp_se_193,);

    }


    @view
    func get_user_total_power_de5740d2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_60_user : felt)-> (__warp_61 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_60_user);
        
        let (__warp_se_194) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_60_user);
        
        let (__warp_se_195) = WSM7_User_ba076238_total_power(__warp_se_194);
        
        let (__warp_se_196) = WS2_READ_Uint256(__warp_se_195);
        
        
        
        return (__warp_se_196,);

    }


    @view
    func get_user_delgated_amount_91b8f785{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_62_user : felt, __warp_63_delegatee : felt)-> (__warp_64 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_63_delegatee);
        
        warp_external_input_check_address(__warp_62_user);
        
        let (__warp_se_197) = WS1_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_62_user);
        
        let (__warp_se_198) = WSM6_User_ba076238_delegates(__warp_se_197);
        
        let (__warp_se_199) = WS0_READ_warp_id(__warp_se_198);
        
        let (__warp_se_200) = WS2_INDEX_felt_to_Uint256(__warp_se_199, __warp_63_delegatee);
        
        let (__warp_se_201) = WS2_READ_Uint256(__warp_se_200);
        
        
        
        return (__warp_se_201,);

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_6__total_supply : Uint256){
    alloc_locals;
    WARP_USED_STORAGE.write(8);
    WARP_NAMEGEN.write(2);


        
        warp_external_input_check_int256(__warp_6__total_supply);
        
        Multi_Vote.__warp_constructor_0(__warp_6__total_supply);
        
        
        
        return ();

    }

@storage_var
func WARP_STORAGE(index: felt) -> (val: felt){
}
@storage_var
func WARP_USED_STORAGE() -> (val: felt){
}
@storage_var
func WARP_NAMEGEN() -> (name: felt){
}
func readId{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) -> (val: felt){
    alloc_locals;
    let (id) = WARP_STORAGE.read(loc);
    if (id == 0){
        let (id) = WARP_NAMEGEN.read();
        WARP_NAMEGEN.write(id + 1);
        WARP_STORAGE.write(loc, id + 1);
        return (id + 1,);
    }else{
        return (id,);
    }
}