local search = require(script:WaitForChild("search"))
local selectedClass = require(script:WaitForChild("selectedClass"))
local selectedMember = require(script:WaitForChild("selectedMember"))
local bookmarks = require(script:WaitForChild("bookmarks"))

return function(state,action)
    state = state or {}
    return {
        search = search(state.search,action),

        selectedClass = selectedClass(state.selectedClass,action),
        selectedMember = selectedMember(state.selectedMember,action),

        bookmarks = bookmarks(state.bookmarks,action),
    }
end