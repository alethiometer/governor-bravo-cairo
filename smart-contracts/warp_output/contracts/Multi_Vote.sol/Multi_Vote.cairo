%lang starknet


from warplib.memory import wm_read_256, wm_read_felt, wm_write_256, wm_write_felt, wm_alloc
from starkware.cairo.common.dict import dict_read, dict_write
from starkware.cairo.common.uint256 import Uint256
from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_ints import warp_external_input_check_int256, warp_external_input_check_int8
from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.starknet.common.syscalls import get_caller_address
from warplib.maths.add import warp_add256
from warplib.maths.ge import warp_ge256
from warplib.maths.sub import warp_sub256
from warplib.maths.gt import warp_gt256
from warplib.maths.eq import warp_eq, warp_eq256
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

func WSM0_User_ba076238_total_availible(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM1_User_ba076238_total_balance(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM2_User_ba076238_delegates(loc: felt) -> (memberLoc: felt){
    return (loc + 6,);
}

func WSM3_User_ba076238_total_power(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
}

func WSM4_Proposal_2cb16fd2_pro(loc: felt) -> (memberLoc: felt){
    return (loc,);
}

func WSM5_Proposal_2cb16fd2_against(loc: felt) -> (memberLoc: felt){
    return (loc + 2,);
}

func WSM6_Proposal_2cb16fd2_abstain(loc: felt) -> (memberLoc: felt){
    return (loc + 4,);
}

func WSM7_Proposal_2cb16fd2_result(loc: felt) -> (memberLoc: felt){
    return (loc + 7,);
}

func WSM8_Proposal_2cb16fd2_votes(loc: felt) -> (memberLoc: felt){
    return (loc + 6,);
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

func WS1_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: Uint256){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    let (read1) = WARP_STORAGE.read(loc + 1);
    return (Uint256(low=read0,high=read1),);
}

func WS2_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
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

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: Uint256) -> (res: Uint256){
    WARP_STORAGE.write(loc, value.low);
    WARP_STORAGE.write(loc + 1, value.high);
    return (value,);
}

func WS_WRITE1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
}

@storage_var
func WARP_MAPPING0(name: felt, index: felt) -> (resLoc : felt){
}
func WS0_INDEX_felt_to_User_ba076238{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING0.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 7);
        WARP_MAPPING0.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}

@storage_var
func WARP_MAPPING1(name: felt, index: felt) -> (resLoc : felt){
}
func WS1_INDEX_felt_to_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: felt) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING1.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 2);
        WARP_MAPPING1.write(name, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}

@storage_var
func WARP_MAPPING2(name: felt, index: Uint256) -> (resLoc : felt){
}
func WS2_INDEX_Uint256_to_Proposal_2cb16fd2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(name: felt, index: Uint256) -> (res: felt){
    alloc_locals;
    let (existing) = WARP_MAPPING2.read(name, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 8);
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


    func __warp_constructor_0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_5__total_supply : Uint256)-> (){
    alloc_locals;


        
        WS_WRITE0(__warp_2_total_supply, __warp_5__total_supply);
        
        let (__warp_6__from) = get_caller_address();
        
        let (__warp_7_from_user) = WS0_INDEX_felt_to_User_ba076238(__warp_4_users, __warp_6__from);
        
        let (__warp_se_0) = WSM0_User_ba076238_total_availible(__warp_7_from_user);
        
        let (__warp_se_1) = WSM0_User_ba076238_total_availible(__warp_7_from_user);
        
        let (__warp_se_2) = WS1_READ_Uint256(__warp_se_1);
        
        let (__warp_se_3) = warp_add256(__warp_se_2, __warp_5__total_supply);
        
        WS_WRITE0(__warp_se_0, __warp_se_3);
        
        let (__warp_se_4) = WSM1_User_ba076238_total_balance(__warp_7_from_user);
        
        let (__warp_se_5) = WSM1_User_ba076238_total_balance(__warp_7_from_user);
        
        let (__warp_se_6) = WS1_READ_Uint256(__warp_se_5);
        
        let (__warp_se_7) = warp_add256(__warp_se_6, __warp_5__total_supply);
        
        WS_WRITE0(__warp_se_4, __warp_se_7);
        
        
        
        return ();

    }


    func __warp_conditional_end_vote_1f6933c3_1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_26_proposal : felt)-> (__warp_rc_0 : felt, __warp_26_proposal : felt){
    alloc_locals;


        
        let (__warp_se_69) = WSM4_Proposal_2cb16fd2_pro(__warp_26_proposal);
        
        let (__warp_se_70) = WS1_READ_Uint256(__warp_se_69);
        
        let (__warp_se_71) = WSM5_Proposal_2cb16fd2_against(__warp_26_proposal);
        
        let (__warp_se_72) = WS1_READ_Uint256(__warp_se_71);
        
        let (__warp_se_73) = warp_gt256(__warp_se_70, __warp_se_72);
        
        if (__warp_se_73 != 0){
        
            
            let (__warp_se_74) = WSM4_Proposal_2cb16fd2_pro(__warp_26_proposal);
            
            let (__warp_se_75) = WS1_READ_Uint256(__warp_se_74);
            
            let (__warp_se_76) = WSM6_Proposal_2cb16fd2_abstain(__warp_26_proposal);
            
            let (__warp_se_77) = WS1_READ_Uint256(__warp_se_76);
            
            let (__warp_se_78) = warp_gt256(__warp_se_75, __warp_se_77);
            
            let __warp_rc_0 = __warp_se_78;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_26_proposal = __warp_26_proposal;
            
            
            
            return (__warp_rc_0, __warp_26_proposal);
        }else{
        
            
            let __warp_rc_0 = 0;
            
            let __warp_rc_0 = __warp_rc_0;
            
            let __warp_26_proposal = __warp_26_proposal;
            
            
            
            return (__warp_rc_0, __warp_26_proposal);
        }

    }


    func __warp_conditional_end_vote_1f6933c3_3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_26_proposal : felt)-> (__warp_rc_2 : felt, __warp_26_proposal : felt){
    alloc_locals;


        
        let (__warp_se_79) = WSM5_Proposal_2cb16fd2_against(__warp_26_proposal);
        
        let (__warp_se_80) = WS1_READ_Uint256(__warp_se_79);
        
        let (__warp_se_81) = WSM4_Proposal_2cb16fd2_pro(__warp_26_proposal);
        
        let (__warp_se_82) = WS1_READ_Uint256(__warp_se_81);
        
        let (__warp_se_83) = warp_gt256(__warp_se_80, __warp_se_82);
        
        if (__warp_se_83 != 0){
        
            
            let (__warp_se_84) = WSM5_Proposal_2cb16fd2_against(__warp_26_proposal);
            
            let (__warp_se_85) = WS1_READ_Uint256(__warp_se_84);
            
            let (__warp_se_86) = WSM6_Proposal_2cb16fd2_abstain(__warp_26_proposal);
            
            let (__warp_se_87) = WS1_READ_Uint256(__warp_se_86);
            
            let (__warp_se_88) = warp_gt256(__warp_se_85, __warp_se_87);
            
            let __warp_rc_2 = __warp_se_88;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_26_proposal = __warp_26_proposal;
            
            
            
            return (__warp_rc_2, __warp_26_proposal);
        }else{
        
            
            let __warp_rc_2 = 0;
            
            let __warp_rc_2 = __warp_rc_2;
            
            let __warp_26_proposal = __warp_26_proposal;
            
            
            
            return (__warp_rc_2, __warp_26_proposal);
        }

    }


    func __warp_conditional___warp_conditional_vote_d3f29ace_5_7(__warp_27__position : felt)-> (__warp_rc_6 : felt, __warp_27__position : felt){
    alloc_locals;


        
        let (__warp_se_94) = warp_eq(__warp_27__position, 1);
        
        if (__warp_se_94 != 0){
        
            
            let __warp_rc_6 = 1;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_27__position = __warp_27__position;
            
            
            
            return (__warp_rc_6, __warp_27__position);
        }else{
        
            
            let (__warp_se_95) = warp_eq(__warp_27__position, 2);
            
            let __warp_rc_6 = __warp_se_95;
            
            let __warp_rc_6 = __warp_rc_6;
            
            let __warp_27__position = __warp_27__position;
            
            
            
            return (__warp_rc_6, __warp_27__position);
        }

    }


    func __warp_conditional_vote_d3f29ace_5(__warp_27__position : felt)-> (__warp_rc_4 : felt, __warp_27__position : felt){
    alloc_locals;


        
        let __warp_rc_6 = 0;
        
            
            let (__warp_tv_4, __warp_tv_5) = __warp_conditional___warp_conditional_vote_d3f29ace_5_7(__warp_27__position);
            
            let __warp_27__position = __warp_tv_5;
            
            let __warp_rc_6 = __warp_tv_4;
        
        if (__warp_rc_6 != 0){
        
            
            let __warp_rc_4 = 1;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_27__position = __warp_27__position;
            
            
            
            return (__warp_rc_4, __warp_27__position);
        }else{
        
            
            let (__warp_se_96) = warp_eq(__warp_27__position, 3);
            
            let __warp_rc_4 = __warp_se_96;
            
            let __warp_rc_4 = __warp_rc_4;
            
            let __warp_27__position = __warp_27__position;
            
            
            
            return (__warp_rc_4, __warp_27__position);
        }

    }


    func vote_d3f29ace_if_part2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_30_proposal : felt, __warp_29__from : felt, __warp_31_from_vote : felt)-> (){
    alloc_locals;


        
        
        
        vote_d3f29ace_if_part1(__warp_30_proposal, __warp_29__from, __warp_31_from_vote);
        
        let __warp_uv6 = ();
        
        
        
        return ();

    }


    func vote_d3f29ace_if_part1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_30_proposal : felt, __warp_29__from : felt, __warp_31_from_vote : felt)-> (){
    alloc_locals;


        
        let (__warp_se_124) = WSM8_Proposal_2cb16fd2_votes(__warp_30_proposal);
        
        let (__warp_se_125) = WS0_READ_warp_id(__warp_se_124);
        
        let (__warp_se_126) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_125, __warp_29__from);
        
        wm_to_storage0(__warp_se_126, __warp_31_from_vote);
        
        
        
        return ();

    }


    func unVote_2c70d64e_if_part2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_35_from_vote : felt, __warp_34_proposal : felt, __warp_33__from : felt)-> (){
    alloc_locals;


        
        
        
        unVote_2c70d64e_if_part1(__warp_35_from_vote, __warp_34_proposal, __warp_33__from);
        
        let __warp_uv7 = ();
        
        
        
        return ();

    }


    func unVote_2c70d64e_if_part1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, warp_memory : DictAccess*}(__warp_35_from_vote : felt, __warp_34_proposal : felt, __warp_33__from : felt)-> (){
    alloc_locals;


        
        let (__warp_se_149) = WM0_Vote_a1796658_amount(__warp_35_from_vote);
        
        wm_write_256(__warp_se_149, Uint256(low=0, high=0));
        
        let (__warp_se_150) = WM1_Vote_a1796658_position(__warp_35_from_vote);
        
        wm_write_felt(__warp_se_150, 0);
        
        let (__warp_se_151) = WSM8_Proposal_2cb16fd2_votes(__warp_34_proposal);
        
        let (__warp_se_152) = WS0_READ_warp_id(__warp_se_151);
        
        let (__warp_se_153) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_152, __warp_33__from);
        
        wm_to_storage0(__warp_se_153, __warp_35_from_vote);
        
        
        
        return ();

    }

}


    @external
    func transferTo_2ccb1b30{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_8__to : felt, __warp_9__amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_9__amount);
        
        warp_external_input_check_address(__warp_8__to);
        
        let (__warp_10__from) = get_caller_address();
        
        let (__warp_11_from_user) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_10__from);
        
        let (__warp_se_8) = WSM0_User_ba076238_total_availible(__warp_11_from_user);
        
        let (__warp_12_total_availible) = WS1_READ_Uint256(__warp_se_8);
        
        let (__warp_se_9) = warp_ge256(__warp_12_total_availible, __warp_9__amount);
        
        with_attr error_message("not enough votes"){
            assert __warp_se_9 = 1;
        }
        
        let (__warp_13_to_user) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_8__to);
        
        let (__warp_se_10) = WSM0_User_ba076238_total_availible(__warp_11_from_user);
        
        let (__warp_se_11) = WSM0_User_ba076238_total_availible(__warp_11_from_user);
        
        let (__warp_se_12) = WS1_READ_Uint256(__warp_se_11);
        
        let (__warp_se_13) = warp_sub256(__warp_se_12, __warp_9__amount);
        
        WS_WRITE0(__warp_se_10, __warp_se_13);
        
        let (__warp_se_14) = WSM0_User_ba076238_total_availible(__warp_13_to_user);
        
        let (__warp_se_15) = WSM0_User_ba076238_total_availible(__warp_13_to_user);
        
        let (__warp_se_16) = WS1_READ_Uint256(__warp_se_15);
        
        let (__warp_se_17) = warp_add256(__warp_se_16, __warp_9__amount);
        
        WS_WRITE0(__warp_se_14, __warp_se_17);
        
        let (__warp_se_18) = WSM1_User_ba076238_total_balance(__warp_11_from_user);
        
        let (__warp_se_19) = WSM1_User_ba076238_total_balance(__warp_11_from_user);
        
        let (__warp_se_20) = WS1_READ_Uint256(__warp_se_19);
        
        let (__warp_se_21) = warp_sub256(__warp_se_20, __warp_9__amount);
        
        WS_WRITE0(__warp_se_18, __warp_se_21);
        
        let (__warp_se_22) = WSM1_User_ba076238_total_balance(__warp_13_to_user);
        
        let (__warp_se_23) = WSM1_User_ba076238_total_balance(__warp_13_to_user);
        
        let (__warp_se_24) = WS1_READ_Uint256(__warp_se_23);
        
        let (__warp_se_25) = warp_add256(__warp_se_24, __warp_9__amount);
        
        WS_WRITE0(__warp_se_22, __warp_se_25);
        
        
        
        return ();

    }


    @external
    func delegateTo_8bcd4620{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_14__to : felt, __warp_15__amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_15__amount);
        
        warp_external_input_check_address(__warp_14__to);
        
        let (__warp_16__from) = get_caller_address();
        
        let (__warp_17_from_user) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_16__from);
        
        let (__warp_se_26) = WSM0_User_ba076238_total_availible(__warp_17_from_user);
        
        let (__warp_18_total_availible) = WS1_READ_Uint256(__warp_se_26);
        
        let (__warp_se_27) = warp_ge256(__warp_18_total_availible, __warp_15__amount);
        
        with_attr error_message("not enough votes availible"){
            assert __warp_se_27 = 1;
        }
        
        let (__warp_19_to_user) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_14__to);
        
        let (__warp_se_28) = WSM0_User_ba076238_total_availible(__warp_17_from_user);
        
        let (__warp_se_29) = WSM0_User_ba076238_total_availible(__warp_17_from_user);
        
        let (__warp_se_30) = WS1_READ_Uint256(__warp_se_29);
        
        let (__warp_se_31) = warp_sub256(__warp_se_30, __warp_15__amount);
        
        WS_WRITE0(__warp_se_28, __warp_se_31);
        
        let __warp_cs_0 = __warp_14__to;
        
        let (__warp_se_32) = WSM2_User_ba076238_delegates(__warp_17_from_user);
        
        let (__warp_se_33) = WS0_READ_warp_id(__warp_se_32);
        
        let (__warp_se_34) = WS1_INDEX_felt_to_Uint256(__warp_se_33, __warp_cs_0);
        
        let (__warp_se_35) = WSM2_User_ba076238_delegates(__warp_17_from_user);
        
        let (__warp_se_36) = WS0_READ_warp_id(__warp_se_35);
        
        let (__warp_se_37) = WS1_INDEX_felt_to_Uint256(__warp_se_36, __warp_cs_0);
        
        let (__warp_se_38) = WS1_READ_Uint256(__warp_se_37);
        
        let (__warp_se_39) = warp_add256(__warp_se_38, __warp_15__amount);
        
        WS_WRITE0(__warp_se_34, __warp_se_39);
        
        let (__warp_se_40) = WSM3_User_ba076238_total_power(__warp_19_to_user);
        
        let (__warp_se_41) = WSM3_User_ba076238_total_power(__warp_19_to_user);
        
        let (__warp_se_42) = WS1_READ_Uint256(__warp_se_41);
        
        let (__warp_se_43) = warp_add256(__warp_se_42, __warp_15__amount);
        
        WS_WRITE0(__warp_se_40, __warp_se_43);
        
        
        
        return ();

    }


    @external
    func undelegate_4d99dd16{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}(__warp_20__to : felt, __warp_21__amount : Uint256)-> (){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_21__amount);
        
        warp_external_input_check_address(__warp_20__to);
        
        let (__warp_se_44) = WS2_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert 1 - __warp_se_44 = 1;
        }
        
        let (__warp_22__from) = get_caller_address();
        
        let (__warp_23_from_user) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_22__from);
        
        let (__warp_se_45) = WSM2_User_ba076238_delegates(__warp_23_from_user);
        
        let (__warp_se_46) = WS0_READ_warp_id(__warp_se_45);
        
        let (__warp_se_47) = WS1_INDEX_felt_to_Uint256(__warp_se_46, __warp_20__to);
        
        let (__warp_24_current_delgated) = WS1_READ_Uint256(__warp_se_47);
        
        let (__warp_se_48) = warp_ge256(__warp_24_current_delgated, __warp_21__amount);
        
        with_attr error_message("undelgating more than balance"){
            assert __warp_se_48 = 1;
        }
        
        let (__warp_25_to_user) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_20__to);
        
        let (__warp_se_49) = WSM0_User_ba076238_total_availible(__warp_23_from_user);
        
        let (__warp_se_50) = WSM0_User_ba076238_total_availible(__warp_23_from_user);
        
        let (__warp_se_51) = WS1_READ_Uint256(__warp_se_50);
        
        let (__warp_se_52) = warp_add256(__warp_se_51, __warp_21__amount);
        
        WS_WRITE0(__warp_se_49, __warp_se_52);
        
        let __warp_cs_1 = __warp_20__to;
        
        let (__warp_se_53) = WSM2_User_ba076238_delegates(__warp_23_from_user);
        
        let (__warp_se_54) = WS0_READ_warp_id(__warp_se_53);
        
        let (__warp_se_55) = WS1_INDEX_felt_to_Uint256(__warp_se_54, __warp_cs_1);
        
        let (__warp_se_56) = WSM2_User_ba076238_delegates(__warp_23_from_user);
        
        let (__warp_se_57) = WS0_READ_warp_id(__warp_se_56);
        
        let (__warp_se_58) = WS1_INDEX_felt_to_Uint256(__warp_se_57, __warp_cs_1);
        
        let (__warp_se_59) = WS1_READ_Uint256(__warp_se_58);
        
        let (__warp_se_60) = warp_sub256(__warp_se_59, __warp_21__amount);
        
        WS_WRITE0(__warp_se_55, __warp_se_60);
        
        let (__warp_se_61) = WSM3_User_ba076238_total_power(__warp_25_to_user);
        
        let (__warp_se_62) = WSM3_User_ba076238_total_power(__warp_25_to_user);
        
        let (__warp_se_63) = WS1_READ_Uint256(__warp_se_62);
        
        let (__warp_se_64) = warp_sub256(__warp_se_63, __warp_21__amount);
        
        WS_WRITE0(__warp_se_61, __warp_se_64);
        
        
        
        return ();

    }


    @external
    func propose_c198f8ba{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*}()-> (){
    alloc_locals;


        
        let (__warp_se_65) = WS2_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert 1 - __warp_se_65 = 1;
        }
        
        let (__warp_se_66) = WS1_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        let (__warp_se_67) = warp_add256(__warp_se_66, Uint256(low=1, high=0));
        
        let (__warp_se_68) = WS_WRITE0(Multi_Vote.__warp_0_curr_proposal, __warp_se_67);
        
        warp_sub256(__warp_se_68, Uint256(low=1, high=0));
        
        WS_WRITE1(Multi_Vote.__warp_1_vote_in_progress, 1);
        
        
        
        return ();

    }


    @external
    func end_vote_1f6933c3{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (result : felt){
    alloc_locals;


        
        let (__warp_se_89) = WS2_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote not in progress"){
            assert __warp_se_89 = 1;
        }
        
        let (__warp_se_90) = WS1_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        let (__warp_26_proposal) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_se_90);
        
        WS_WRITE1(Multi_Vote.__warp_1_vote_in_progress, 0);
        
        let __warp_rc_0 = 0;
        
            
            let (__warp_tv_0, __warp_td_0) = Multi_Vote.__warp_conditional_end_vote_1f6933c3_1(__warp_26_proposal);
            
            let __warp_tv_1 = __warp_td_0;
            
            let __warp_26_proposal = __warp_tv_1;
            
            let __warp_rc_0 = __warp_tv_0;
        
        if (__warp_rc_0 != 0){
        
            
            let (__warp_se_91) = WSM7_Proposal_2cb16fd2_result(__warp_26_proposal);
            
            WS_WRITE1(__warp_se_91, 1);
            
            
            
            return (1,);
        }else{
        
            
            let __warp_rc_2 = 0;
            
                
                let (__warp_tv_2, __warp_td_1) = Multi_Vote.__warp_conditional_end_vote_1f6933c3_3(__warp_26_proposal);
                
                let __warp_tv_3 = __warp_td_1;
                
                let __warp_26_proposal = __warp_tv_3;
                
                let __warp_rc_2 = __warp_tv_2;
            
            if (__warp_rc_2 != 0){
            
                
                let (__warp_se_92) = WSM7_Proposal_2cb16fd2_result(__warp_26_proposal);
                
                WS_WRITE1(__warp_se_92, 2);
                
                
                
                return (2,);
            }else{
            
                
                let (__warp_se_93) = WSM7_Proposal_2cb16fd2_result(__warp_26_proposal);
                
                WS_WRITE1(__warp_se_93, 3);
                
                
                
                return (3,);
            }
        }

    }


    @external
    func vote_d3f29ace{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_27__position : felt, __warp_28__amount : Uint256)-> (){
    alloc_locals;
    let (local warp_memory : DictAccess*) = default_dict_new(0);
    local warp_memory_start: DictAccess* = warp_memory;
    dict_write{dict_ptr=warp_memory}(0,1);
    with warp_memory{

        
        warp_external_input_check_int256(__warp_28__amount);
        
        warp_external_input_check_int8(__warp_27__position);
        
        let (__warp_se_97) = WS2_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert __warp_se_97 = 1;
        }
        
        let __warp_rc_4 = 0;
        
            
            let (__warp_tv_6, __warp_tv_7) = Multi_Vote.__warp_conditional_vote_d3f29ace_5(__warp_27__position);
            
            let __warp_27__position = __warp_tv_7;
            
            let __warp_rc_4 = __warp_tv_6;
        
        with_attr error_message("vote not valid"){
            assert __warp_rc_4 = 1;
        }
        
        let (__warp_29__from) = get_caller_address();
        
        let (__warp_se_98) = WS1_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        let (__warp_30_proposal) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_se_98);
        
        let (__warp_se_99) = WSM8_Proposal_2cb16fd2_votes(__warp_30_proposal);
        
        let (__warp_se_100) = WS0_READ_warp_id(__warp_se_99);
        
        let (__warp_se_101) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_100, __warp_29__from);
        
        let (__warp_31_from_vote) = ws_to_memory0(__warp_se_101);
        
        let (__warp_se_102) = WM0_Vote_a1796658_amount(__warp_31_from_vote);
        
        let (__warp_se_103) = wm_read_256(__warp_se_102);
        
        let (__warp_se_104) = warp_eq256(__warp_se_103, Uint256(low=0, high=0));
        
        with_attr error_message("already voted"){
            assert __warp_se_104 = 1;
        }
        
        let (__warp_se_105) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_29__from);
        
        let (__warp_se_106) = WSM3_User_ba076238_total_power(__warp_se_105);
        
        let (__warp_32_total_power) = WS1_READ_Uint256(__warp_se_106);
        
        let (__warp_se_107) = warp_ge256(__warp_32_total_power, __warp_28__amount);
        
        with_attr error_message("not enough votes availible"){
            assert __warp_se_107 = 1;
        }
        
        let (__warp_se_108) = WM0_Vote_a1796658_amount(__warp_31_from_vote);
        
        wm_write_256(__warp_se_108, __warp_28__amount);
        
        let (__warp_se_109) = WM1_Vote_a1796658_position(__warp_31_from_vote);
        
        wm_write_felt(__warp_se_109, __warp_27__position);
        
        let (__warp_se_110) = warp_eq(__warp_27__position, 1);
        
        if (__warp_se_110 != 0){
        
            
                
                let (__warp_se_111) = WSM4_Proposal_2cb16fd2_pro(__warp_30_proposal);
                
                let (__warp_se_112) = WSM4_Proposal_2cb16fd2_pro(__warp_30_proposal);
                
                let (__warp_se_113) = WS1_READ_Uint256(__warp_se_112);
                
                let (__warp_se_114) = warp_add256(__warp_se_113, __warp_28__amount);
                
                WS_WRITE0(__warp_se_111, __warp_se_114);
            
            Multi_Vote.vote_d3f29ace_if_part1(__warp_30_proposal, __warp_29__from, __warp_31_from_vote);
            
            let __warp_uv0 = ();
            
            default_dict_finalize(warp_memory_start, warp_memory, 0);
            
            
            return ();
        }else{
        
            
                
                let (__warp_se_115) = warp_eq(__warp_27__position, 2);
                
                if (__warp_se_115 != 0){
                
                    
                        
                        let (__warp_se_116) = WSM5_Proposal_2cb16fd2_against(__warp_30_proposal);
                        
                        let (__warp_se_117) = WSM5_Proposal_2cb16fd2_against(__warp_30_proposal);
                        
                        let (__warp_se_118) = WS1_READ_Uint256(__warp_se_117);
                        
                        let (__warp_se_119) = warp_add256(__warp_se_118, __warp_28__amount);
                        
                        WS_WRITE0(__warp_se_116, __warp_se_119);
                    
                    Multi_Vote.vote_d3f29ace_if_part2(__warp_30_proposal, __warp_29__from, __warp_31_from_vote);
                    
                    let __warp_uv1 = ();
                    
                    default_dict_finalize(warp_memory_start, warp_memory, 0);
                    
                    
                    return ();
                }else{
                
                    
                        
                        let (__warp_se_120) = WSM6_Proposal_2cb16fd2_abstain(__warp_30_proposal);
                        
                        let (__warp_se_121) = WSM6_Proposal_2cb16fd2_abstain(__warp_30_proposal);
                        
                        let (__warp_se_122) = WS1_READ_Uint256(__warp_se_121);
                        
                        let (__warp_se_123) = warp_add256(__warp_se_122, __warp_28__amount);
                        
                        WS_WRITE0(__warp_se_120, __warp_se_123);
                    
                    Multi_Vote.vote_d3f29ace_if_part2(__warp_30_proposal, __warp_29__from, __warp_31_from_vote);
                    
                    let __warp_uv2 = ();
                    
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

        
        let (__warp_se_127) = WS2_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        with_attr error_message("vote in progress"){
            assert __warp_se_127 = 1;
        }
        
        let (__warp_33__from) = get_caller_address();
        
        let (__warp_se_128) = WS1_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        let (__warp_34_proposal) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_se_128);
        
        let (__warp_se_129) = WSM8_Proposal_2cb16fd2_votes(__warp_34_proposal);
        
        let (__warp_se_130) = WS0_READ_warp_id(__warp_se_129);
        
        let (__warp_se_131) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_130, __warp_33__from);
        
        let (__warp_35_from_vote) = ws_to_memory0(__warp_se_131);
        
        let (__warp_se_132) = WM1_Vote_a1796658_position(__warp_35_from_vote);
        
        let (__warp_36_position) = wm_read_felt(__warp_se_132);
        
        let (__warp_se_133) = WM0_Vote_a1796658_amount(__warp_35_from_vote);
        
        let (__warp_37_total_amount) = wm_read_256(__warp_se_133);
        
        let (__warp_se_134) = warp_neq256(__warp_37_total_amount, Uint256(low=0, high=0));
        
        with_attr error_message("not voted yet"){
            assert __warp_se_134 = 1;
        }
        
        let (__warp_se_135) = warp_eq(__warp_36_position, 1);
        
        if (__warp_se_135 != 0){
        
            
                
                let (__warp_se_136) = WSM4_Proposal_2cb16fd2_pro(__warp_34_proposal);
                
                let (__warp_se_137) = WSM4_Proposal_2cb16fd2_pro(__warp_34_proposal);
                
                let (__warp_se_138) = WS1_READ_Uint256(__warp_se_137);
                
                let (__warp_se_139) = warp_sub256(__warp_se_138, __warp_37_total_amount);
                
                WS_WRITE0(__warp_se_136, __warp_se_139);
            
            Multi_Vote.unVote_2c70d64e_if_part1(__warp_35_from_vote, __warp_34_proposal, __warp_33__from);
            
            let __warp_uv3 = ();
            
            default_dict_finalize(warp_memory_start, warp_memory, 0);
            
            
            return ();
        }else{
        
            
                
                let (__warp_se_140) = warp_eq(__warp_36_position, 2);
                
                if (__warp_se_140 != 0){
                
                    
                        
                        let (__warp_se_141) = WSM5_Proposal_2cb16fd2_against(__warp_34_proposal);
                        
                        let (__warp_se_142) = WSM5_Proposal_2cb16fd2_against(__warp_34_proposal);
                        
                        let (__warp_se_143) = WS1_READ_Uint256(__warp_se_142);
                        
                        let (__warp_se_144) = warp_sub256(__warp_se_143, __warp_37_total_amount);
                        
                        WS_WRITE0(__warp_se_141, __warp_se_144);
                    
                    Multi_Vote.unVote_2c70d64e_if_part2(__warp_35_from_vote, __warp_34_proposal, __warp_33__from);
                    
                    let __warp_uv4 = ();
                    
                    default_dict_finalize(warp_memory_start, warp_memory, 0);
                    
                    
                    return ();
                }else{
                
                    
                        
                        let (__warp_se_145) = WSM6_Proposal_2cb16fd2_abstain(__warp_34_proposal);
                        
                        let (__warp_se_146) = WSM6_Proposal_2cb16fd2_abstain(__warp_34_proposal);
                        
                        let (__warp_se_147) = WS1_READ_Uint256(__warp_se_146);
                        
                        let (__warp_se_148) = warp_sub256(__warp_se_147, __warp_37_total_amount);
                        
                        WS_WRITE0(__warp_se_145, __warp_se_148);
                    
                    Multi_Vote.unVote_2c70d64e_if_part2(__warp_35_from_vote, __warp_34_proposal, __warp_33__from);
                    
                    let __warp_uv5 = ();
                    
                    default_dict_finalize(warp_memory_start, warp_memory, 0);
                    
                    
                    return ();
                }
        }
    }
    }


    @view
    func get_curr_proposal_ca3adffc{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_38 : Uint256){
    alloc_locals;


        
        let (__warp_se_154) = WS1_READ_Uint256(Multi_Vote.__warp_0_curr_proposal);
        
        
        
        return (__warp_se_154,);

    }


    @view
    func get_vote_in_progress_e72997a8{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_39 : felt){
    alloc_locals;


        
        let (__warp_se_155) = WS2_READ_felt(Multi_Vote.__warp_1_vote_in_progress);
        
        
        
        return (__warp_se_155,);

    }


    @view
    func get_total_supply_f923058c{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_40 : Uint256){
    alloc_locals;


        
        let (__warp_se_156) = WS1_READ_Uint256(Multi_Vote.__warp_2_total_supply);
        
        
        
        return (__warp_se_156,);

    }


    @view
    func get_proposal_pro_df6578be{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_41__proposal : Uint256)-> (__warp_42 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_41__proposal);
        
        let (__warp_se_157) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_41__proposal);
        
        let (__warp_se_158) = WSM4_Proposal_2cb16fd2_pro(__warp_se_157);
        
        let (__warp_se_159) = WS1_READ_Uint256(__warp_se_158);
        
        
        
        return (__warp_se_159,);

    }


    @view
    func get_proposal_against_b3897a04{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_43__proposal : Uint256)-> (__warp_44 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_43__proposal);
        
        let (__warp_se_160) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_43__proposal);
        
        let (__warp_se_161) = WSM5_Proposal_2cb16fd2_against(__warp_se_160);
        
        let (__warp_se_162) = WS1_READ_Uint256(__warp_se_161);
        
        
        
        return (__warp_se_162,);

    }


    @view
    func get_proposal_abstain_ddaeb1d0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_45__proposal : Uint256)-> (__warp_46 : Uint256){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_45__proposal);
        
        let (__warp_se_163) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_45__proposal);
        
        let (__warp_se_164) = WSM6_Proposal_2cb16fd2_abstain(__warp_se_163);
        
        let (__warp_se_165) = WS1_READ_Uint256(__warp_se_164);
        
        
        
        return (__warp_se_165,);

    }


    @view
    func get_proposal_result_e5302c2f{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_47__proposal : Uint256)-> (__warp_48 : felt){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_47__proposal);
        
        let (__warp_se_166) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_47__proposal);
        
        let (__warp_se_167) = WSM7_Proposal_2cb16fd2_result(__warp_se_166);
        
        let (__warp_se_168) = WS2_READ_felt(__warp_se_167);
        
        
        
        return (__warp_se_168,);

    }


    @view
    func get_vote_amount_3bd5be94{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_49__proposal : Uint256, __warp_50_voter : felt)-> (__warp_51 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_50_voter);
        
        warp_external_input_check_int256(__warp_49__proposal);
        
        let (__warp_se_169) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_49__proposal);
        
        let (__warp_se_170) = WSM8_Proposal_2cb16fd2_votes(__warp_se_169);
        
        let (__warp_se_171) = WS0_READ_warp_id(__warp_se_170);
        
        let (__warp_se_172) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_171, __warp_50_voter);
        
        let (__warp_se_173) = WSM9_Vote_a1796658_amount(__warp_se_172);
        
        let (__warp_se_174) = WS1_READ_Uint256(__warp_se_173);
        
        
        
        return (__warp_se_174,);

    }


    @view
    func get_vote_position_d81aeb20{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_52__proposal : Uint256, __warp_53_voter : felt)-> (__warp_54 : felt){
    alloc_locals;


        
        warp_external_input_check_address(__warp_53_voter);
        
        warp_external_input_check_int256(__warp_52__proposal);
        
        let (__warp_se_175) = WS2_INDEX_Uint256_to_Proposal_2cb16fd2(Multi_Vote.__warp_3_proposals, __warp_52__proposal);
        
        let (__warp_se_176) = WSM8_Proposal_2cb16fd2_votes(__warp_se_175);
        
        let (__warp_se_177) = WS0_READ_warp_id(__warp_se_176);
        
        let (__warp_se_178) = WS3_INDEX_felt_to_Vote_a1796658(__warp_se_177, __warp_53_voter);
        
        let (__warp_se_179) = WSM10_Vote_a1796658_position(__warp_se_178);
        
        let (__warp_se_180) = WS2_READ_felt(__warp_se_179);
        
        
        
        return (__warp_se_180,);

    }


    @view
    func get_user_total_balance_b39649ea{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_55_user : felt)-> (__warp_56 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_55_user);
        
        let (__warp_se_181) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_55_user);
        
        let (__warp_se_182) = WSM1_User_ba076238_total_balance(__warp_se_181);
        
        let (__warp_se_183) = WS1_READ_Uint256(__warp_se_182);
        
        
        
        return (__warp_se_183,);

    }


    @view
    func get_user_total_availible_1cd6e9b8{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_57_user : felt)-> (__warp_58 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_57_user);
        
        let (__warp_se_184) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_57_user);
        
        let (__warp_se_185) = WSM0_User_ba076238_total_availible(__warp_se_184);
        
        let (__warp_se_186) = WS1_READ_Uint256(__warp_se_185);
        
        
        
        return (__warp_se_186,);

    }


    @view
    func get_user_total_power_de5740d2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_59_user : felt)-> (__warp_60 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_59_user);
        
        let (__warp_se_187) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_59_user);
        
        let (__warp_se_188) = WSM3_User_ba076238_total_power(__warp_se_187);
        
        let (__warp_se_189) = WS1_READ_Uint256(__warp_se_188);
        
        
        
        return (__warp_se_189,);

    }


    @view
    func get_user_delgated_amount_91b8f785{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_61_user : felt, __warp_62_delegatee : felt)-> (__warp_63 : Uint256){
    alloc_locals;


        
        warp_external_input_check_address(__warp_62_delegatee);
        
        warp_external_input_check_address(__warp_61_user);
        
        let (__warp_se_190) = WS0_INDEX_felt_to_User_ba076238(Multi_Vote.__warp_4_users, __warp_61_user);
        
        let (__warp_se_191) = WSM2_User_ba076238_delegates(__warp_se_190);
        
        let (__warp_se_192) = WS0_READ_warp_id(__warp_se_191);
        
        let (__warp_se_193) = WS1_INDEX_felt_to_Uint256(__warp_se_192, __warp_62_delegatee);
        
        let (__warp_se_194) = WS1_READ_Uint256(__warp_se_193);
        
        
        
        return (__warp_se_194,);

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_5__total_supply : Uint256){
    alloc_locals;
    WARP_USED_STORAGE.write(7);
    WARP_NAMEGEN.write(2);


        
        warp_external_input_check_int256(__warp_5__total_supply);
        
        Multi_Vote.__warp_constructor_0(__warp_5__total_supply);
        
        
        
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