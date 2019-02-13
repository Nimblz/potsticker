return function(state, action)
    state = state or ""

    if action.type == "SEARCH_SET" then
        return action.search
    end

    return state
end