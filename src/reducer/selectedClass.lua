return function(state, action)
    state = state or ""

    if action.type == "CLASS_SELECT" then
        return action.class
    end

    return state
end