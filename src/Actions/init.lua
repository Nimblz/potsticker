local Actions = {
    CLASS_SELECT = require(script.CLASS_SELECT), -- Select passed class, populate member list.
    MEMBER_SELECT = require(script.MEMBER_SELECT), -- Select passed member of currently selected class.
    BOOKMARK_ADD = require(script.BOOKMARK_ADD), -- Add selected class/member pair to bookmarks.
    BOOKMARK_REMOVE = require(script.BOOKMARK_REMOVE), -- Remove class/member bookmark.
    SEARCH_SET = require(script.SEARCH_SET), -- Set search query.
}

return Actions