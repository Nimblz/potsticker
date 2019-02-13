return function(state, action)
    state = state or ""

    if action.type == "MEMBER_SELECT" then
        return action.member
    end

    return state
end