local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

local function tokenize(bookmark)
    return (bookmark.class or "nil").."-"..(bookmark.member or "nil")
end

return function(state, action)
    state = state or {allBookmarks = {}, byPair = {}}

    local bookmark = action.bookmark

    if action.type == "BOOKMARK_ADD" then
        state = deepcopy(state)

        local index = #state.allBookmarks+1

        state.allBookmarks[index] = bookmark

        for k,v in pairs(bookmark) do
            print(k,v)
        end

        state.byPair[tokenize(bookmark)] = index

        return state
    elseif action.type == "BOOKMARK_REMOVE" then
        state = deepcopy(state)

        local index = state.byPair[tokenize(bookmark)]

        if index then
            -- count of bookmarks before removal
            local numBookmarks = #state.allBookmarks

            -- remove bookmark and index
            state.allBookmarks[index] = nil
            state.byPair[tokenize(bookmark)] = nil

            -- shift all in front down one index
            for i = index+1, numBookmarks  do
                state.byPair[tokenize(state.allBookmarks[i])] = i-1
                state.allBookmarks[i-1] = state.allBookmarks[i]
                state.allBookmarks[i] = nil
            end
        end

        return state
    end

    return state
end