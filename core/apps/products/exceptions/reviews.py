from dataclasses import dataclass

from core.apps.common.exceptions import ServiceException


@dataclass(eq=False)
class RewiewNotFoundException(ServiceException):
    review_id: int

    @property
    def message(self):
        return "Review not found"


@dataclass(eq=False)
class ReviewInvalidRatingException(ServiceException):
    rating: int

    @property
    def message(self):
        return 'Rating is not valid'
